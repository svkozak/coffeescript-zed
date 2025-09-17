use std::fs;
use zed_extension_api::{self as zed, LanguageServerId, Result};

struct CoffeeScriptExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for CoffeeScriptExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        match language_server_id.as_ref() {
            "coffeesense" => {
                let command = self.language_server_binary_path(language_server_id, worktree)?;
                
                Ok(zed::Command {
                    command,
                    args: vec!["--stdio".to_string()],
                    env: Default::default(),
                })
            }
            _ => Err(format!(
                "Unrecognized language server for CoffeeScript: {language_server_id}"
            )
            .into()),
        }
    }
}

impl CoffeeScriptExtension {
    fn language_server_binary_path(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<String> {
        // First, try to find coffeesense-language-server in PATH (user-installed)
        if let Some(path) = worktree.which("coffeesense-language-server") {
            return Ok(path);
        }

        // Check if we've already installed it locally
        let server_path = "node_modules/.bin/coffeesense-language-server";
        if let Some(cached_path) = &self.cached_binary_path {
            if fs::metadata(cached_path).map_or(false, |stat| stat.is_file()) {
                return Ok(cached_path.clone());
            }
        }

        // Install coffeesense-language-server via npm
        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::CheckingForUpdate,
        );

        let package_name = "coffeesense-language-server";
        
        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::Downloading,
        );

        let version = zed::npm_package_latest_version(package_name)?;
        zed::npm_install_package(package_name, &version)?;

        // Verify installation
        if !fs::metadata(server_path).map_or(false, |stat| stat.is_file()) {
            return Err(format!(
                "Failed to install coffeesense-language-server. Please install manually with: npm install -g {}", 
                package_name
            ));
        }

        self.cached_binary_path = Some(server_path.to_string());
        Ok(server_path.to_string())
    }
}

zed::register_extension!(CoffeeScriptExtension);
# Windows RDP Setup

This devcontainer now includes Windows Remote Desktop Protocol (RDP) support via xrdp, allowing you to connect to the Ubuntu desktop environment using any Windows RDP client.

## What's Included

- **xrdp**: X Remote Desktop Protocol server
- **XFCE Desktop Environment**: Lightweight desktop environment
- **Port 3389**: Standard RDP port exposed and forwarded

## How to Connect

1. **Start the devcontainer** - The RDP service will start automatically
2. **Find the forwarded port** - Port 3389 will be forwarded by the development environment
3. **Connect via RDP client**:
   - **Windows**: Use built-in "Remote Desktop Connection" (mstsc.exe)
   - **macOS**: Use Microsoft Remote Desktop from App Store
   - **Linux**: Use Remmina or rdesktop

## Connection Details

- **Host**: localhost (or the forwarded port URL provided by your development environment)
- **Port**: 3389
- **Username**: devuser
- **Password**: devpassword (as configured in Dockerfile)

## Features Available

- Full XFCE desktop environment
- All development tools (git, vim, python3, etc.)
- SSH access still available on port 22
- Shared workspace directory at `/workspaces`

## Troubleshooting

If RDP connection fails:
1. Check that the devcontainer has started successfully
2. Verify port 3389 is being forwarded
3. Try restarting the xrdp service: `sudo service xrdp restart`
4. Check service status: `sudo service xrdp status`

## Security Notes

- The default password is set for development purposes only
- Change the password in production environments
- Consider using SSH key authentication for secure environments
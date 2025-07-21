
#!/bin/sh

# Define the special workspace index and application
APP="$1"
SPECIAL_WORKSPACE="$2"

# Debug output to check if variables are set correctly
echo "APP: $APP"
echo "SPECIAL_WORKSPACE: $SPECIAL_WORKSPACE"

# Function to check if a workspace is empty
is_workspace_empty() {
  local workspace_index="$1"
  local window_count
  window_count=$(yabai -m query --windows --space "$workspace_index" | jq '. | length')
  [ "$window_count" -eq 0 ]
}

# Get the current workspace
CURRENT_WORKSPACE=$(yabai -m query --spaces | jq '.[] | select(.["is-visible"]==true).index')

# Debug output to check the current workspace
echo "CURRENT_WORKSPACE: $CURRENT_WORKSPACE"

# Check if CURRENT_WORKSPACE and SPECIAL_WORKSPACE are not empty and are integers
if [ -z "$CURRENT_WORKSPACE" ] || [ -z "$SPECIAL_WORKSPACE" ]; then
  exit 1
fi

# Toggle between the current workspace and the special workspace
if [ "$CURRENT_WORKSPACE" -eq "$SPECIAL_WORKSPACE" ]; then
  # If on the special workspace, switch to the last used workspace
  yabai -m space --focus recent
else
  # If not on the special workspace, switch to the special workspace
  yabai -m space --focus "$SPECIAL_WORKSPACE"

  # Check if the workspace is empty and launch the application if it is
  if is_workspace_empty "$SPECIAL_WORKSPACE"; then
    open -a "$APP"
  fi
fi

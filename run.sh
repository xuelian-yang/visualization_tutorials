#!/bin/bash

source /opt/ros/foxy/setup.bash

# completely rebuild
enable_completely_rebuild=true
if [ "$enable_completely_rebuild" == true ]; then
  rm -rf log
  rm -rf build
  rm -rf install
fi

# colcon build --symlink-install
colcon build --packages-select rviz_plugin_tutorials
source install/setup.bash

# ros2 launch lidar start_lidar.py
# ros2 launch lidar start_hdmap.py

# ros2 run rviz_plugin_tutorials send_test_msgs.py
gnome-terminal -- bash -c "echo '===== msgs publisher ====='; ros2 run rviz_plugin_tutorials send_test_msgs.py; exec bash"

# ros2 run rviz2 rviz2 -d rviz_plugin_tutorials/rviz/rviz2_plugin.rviz
gnome-terminal -- bash -c "echo '===== rviz2 ====='; ros2 run rviz2 rviz2 -d rviz_plugin_tutorials/rviz/rviz2_plugin.rviz; exec bash"

# ros2 topic list
gnome-terminal -- bash -c "echo '===== ros2 topic list ====='; ros2 topic list; exec bash"

if fresh_plug_install == 1
  :so $MYVIMRC
  :PluginInstall
  silent !echo ""
  silent !echo "Vim is now ready."
  :cq
endif

This is my personal overlay.

I switched from archlinux, and found many packages missing in gentoo, so I decide to package them by myself. As I am a newbie to gentoo, I can not expect perfection of every ebuild files, but I could guarantee that they all do work on my laptop. Because I am not familiar with open source licenses, and some of the ebuild script is actually copied from other place (such as aur and gentoo official repo) with just a little modification, I also could not figure out which license to use, so I just write down the source in the comment of each ebuild.

The procession of packaging is far from finish, I may add new packages as often as a few days. I also plan to move some of the packages to gentoo-zh, but currently I have doubts about the quality of my packaging especially license concerned parts.

All the ebuilds in the overlay is marked as only `~amd64` keywords even it is practically supported by other plantform, as I have only amd64 plantform to test. Furthermore, I may modify an ebuild file without reversion, 

Feel free to use or contribute to this repo.

Currently, the following packages is added and I will update them maybe once a week:

* app-backup/snapper-gui
  * pick from [zyrenth overlay](https://github.com/gentoo-mirror/zyrenth)
  * use last commit date as version, instead of `9999`
  * fix `.desktop` file
  * also available in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* app-dicts/copytranslator
  * pick from [aur](https://aur.archlinux.org/packages/copytranslator-appimage/)
  * also avialable in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* app-editors/typora
  * pick from [aur](https://aur.archlinux.org/packages/typora/)
  * delete some (maybe) unnecessary operations such as `chmod`
  * also available in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* app-emulation/proton-ge-custom-bin
  * pick from [aur](https://aur.archlinux.org/packages/proton-ge-custom-bin/)
  * need some package from [pg_overlay](https://github.com/perfect7gentleman/pg_overlay) and [wine overlay](https://github.com/gentoo-mirror/wine)
* app-misc/rmtrash
  * pick from [aur](https://aur.archlinux.org/packages/rmtrash/)
  * also available in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* dev-cpp/cppcoro
  * pick from [aur](https://aur.archlinux.org/packages/cppcoro-cmake-git/)
  * use last commit date as version, instead of `9999`
* dev-cpp/date
  * also available in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* dev-cpp/nameof
* dev-cpp/tgbot-cpp
  * use last commit date as version, instead of `9999`
* dev-cpp/xtl
* dev-libs/boost
  * pick from gentoo official
  * add `stacktrace` and `static-libs` use flag
* dev-libs/libbacktrace
* dev-python/python-telegram-bot
  * pick from [guru overlay](https://github.com/gentoo-mirror/guru) with version bump
* dev-util/nvhpc
  * pick from [aur](https://aur.archlinux.org/packages/nvhpc/)
  * need some package from [science overlay](https://github.com/gentoo-mirror/science)
* dev-util/nvidia-cuda-toolkit
  * pick from gentoo official
  * export `CUDA_PATH` environment variable to make other packaging process easier
* sci-chemistry/ovito
  * pick from [aur](https://aur.archlinux.org/packages/ovito/)
* sci-chemistry/vesta
  * pick from [aur](https://aur.archlinux.org/packages/vesta/)
  * hold version 3.5.5, as a [behavior change in 3.5.6](https://groups.google.com/g/vesta-discuss/c/y7TCMRe1HlA)
  * also available in [gentoo-zh](https://github.com/microcai/gentoo-zh)
* sci-libs/arrayfire
  * pick from gentoo official
  * remove `cuda` use flag as it causes build failed
  * disable `network-sandbox` and add `-fpermissive` to flags. I know it is not safe, but it makes packaging easier.
  * enable `mkl` as default, and redefine original `mkl` flag as `static-mkl`
  * a fix from Archlinux official
* sci-libs/clfft
  * pick from [science overlay](https://github.com/gentoo-mirror/science)
  * add `-fpermissive` to flags
* sci-libs/cosma
  * pick from [aur](https://aur.archlinux.org/packages/cosma/)
  * use system costa as dependence
* sci-libs/costa
* sci-libs/libxsmm
  * pick from [aur](https://aur.archlinux.org/packages/libxsmm/)
  * patch to install into lib64
* sci-libs/spglib
  * pick from gentoo official with version bump
* sci-mathematics/mathematica
  * pick from gentoo official with version bump
  * many modify to make things works
* sci-visualization/forge
  * pick from [science overlay](https://github.com/gentoo-mirror/science)
  * disable `network-sandbox`
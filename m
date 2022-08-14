Content-Type: multipart/mixed; boundary="===============9214861624691864437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sun, 14 Aug 2022 11:15:59 +0800
Message-ID: <202208141130.MC39yYet-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9214861624691864437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE =
support
date:   2 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-s041-20220814 (https://download.01.org/0day-ci=
/archive/20220814/202208141130.MC39yYet-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/tree_stall.h:941:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:941:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:941:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:941:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __perc=
pu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __perc=
pu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __perc=
pu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __perc=
pu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got int [nodere=
f] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void *ptr @@     got unsigned in=
t [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __perc=
pu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: too many warnings

vim +2247 kernel/rcu/tree.c

f41d911f8c49a5 kernel/rcutree.c  Paul E. McKenney 2009-08-22  2215  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2216  /*
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2217   * Simi=
lar to rcu_report_qs_rdp(), for which it is a helper function.
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2218   * Allo=
ws quiescent states for a group of CPUs to be reported at one go
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2219   * to t=
he specified rcu_node structure, though all the CPUs in the group
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2220   * must=
 be represented by the same rcu_node structure (which need not be a
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2221   * leaf=
 rcu_node structure, though it often will be).  The gps parameter
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2222   * is t=
he grace-period snapshot, which means that the quiescent states
c9a24e2d0c7d33 kernel/rcu/tree.c Paul E. McKenney 2018-04-27  2223   * are =
valid only if rnp->gp_seq is equal to gps.  That structure's lock
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2224   * must=
 be held upon entry, and it is released before return.
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2225   *
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2226   * As a=
 special case, if mask is zero, the bit-already-cleared check is
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2227   * disa=
bled.  This allows propagating quiescent state due to resumed tasks
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2228   * duri=
ng grace-period initialization.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2229   */
b50912d0b5e03f kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2230  static =
void rcu_report_qs_rnp(unsigned long mask, struct rcu_node *rnp,
b50912d0b5e03f kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2231  			    =
  unsigned long gps, unsigned long flags)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2232  	__rele=
ases(rnp->lock)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2233  {
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2234  	unsign=
ed long oldmask =3D 0;
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2235  	struct=
 rcu_node *rnp_c;
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2236  =

a32e01ee689794 kernel/rcu/tree.c Matthew Wilcox   2018-01-17  2237  	raw_lo=
ckdep_assert_held_rcu_node(rnp);
c0b334c5bfa98a kernel/rcu/tree.c Paul E. McKenney 2017-04-28  2238  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2239  	/* Wal=
k up the rcu_node hierarchy. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2240  	for (;=
;) {
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2241  		if ((=
!(rnp->qsmask & mask) && mask) || rnp->gp_seq !=3D gps) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2242  =

654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2243  			/*
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2244  			 * O=
ur bit has already been cleared, or the
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2245  			 * r=
elevant grace period is already over, so done.
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2246  			 */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29 @2247  			raw_=
spin_unlock_irqrestore_rcu_node(rnp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2248  			retu=
rn;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2249  		}
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2250  		WARN_=
ON_ONCE(oldmask); /* Any child must be all zeroed! */
5b4c11d54b1b8d kernel/rcu/tree.c Paul E. McKenney 2018-04-13  2251  		WARN_=
ON_ONCE(!rcu_is_leaf_node(rnp) &&
2dee9404fa8c43 kernel/rcu/tree.c Paul E. McKenney 2017-07-11  2252  			    =
 rcu_preempt_blocked_readers_cgp(rnp));
7672d647ddae37 kernel/rcu/tree.c Paul E. McKenney 2020-01-03  2253  		WRITE=
_ONCE(rnp->qsmask, rnp->qsmask & ~mask);
67a0edbf3c4dfc kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2254  		trace=
_rcu_quiescent_state_report(rcu_state.name, rnp->gp_seq,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2255  						 =
mask, rnp->qsmask, rnp->level,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2256  						 =
rnp->grplo, rnp->grphi,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2257  						 =
!!rnp->gp_tasks);
27f4d28057adf9 kernel/rcutree.c  Paul E. McKenney 2011-02-07  2258  		if (r=
np->qsmask !=3D 0 || rcu_preempt_blocked_readers_cgp(rnp)) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2259  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2260  			/* O=
ther bits still set at this level, so done. */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29  2261  			raw_=
spin_unlock_irqrestore_rcu_node(rnp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2262  			retu=
rn;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2263  		}
d43a5d32e125db kernel/rcu/tree.c Paul E. McKenney 2018-04-28  2264  		rnp->=
completedqs =3D rnp->gp_seq;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2265  		mask =
=3D rnp->grpmask;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2266  		if (r=
np->parent =3D=3D NULL) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2267  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2268  			/* N=
o more levels.  Exit loop holding root lock. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2269  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2270  			brea=
k;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2271  		}
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29  2272  		raw_s=
pin_unlock_irqrestore_rcu_node(rnp, flags);
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2273  		rnp_c=
 =3D rnp;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2274  		rnp =
=3D rnp->parent;
2a67e741bbbc02 kernel/rcu/tree.c Peter Zijlstra   2015-10-08  2275  		raw_s=
pin_lock_irqsave_rcu_node(rnp, flags);
0937d045732b5d kernel/rcu/tree.c Paul E. McKenney 2020-01-03  2276  		oldma=
sk =3D READ_ONCE(rnp_c->qsmask);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2277  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2278  =

64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2279  	/*
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2280  	 * Get=
 here if we are the last CPU to pass through a quiescent
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2281  	 * sta=
te for this grace period.  Invoke rcu_report_qs_rsp()
f41d911f8c49a5 kernel/rcutree.c  Paul E. McKenney 2009-08-22  2282  	 * to =
clean up and start the next grace period if one is needed.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2283  	 */
aff4e9ede52bad kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2284  	rcu_re=
port_qs_rsp(flags); /* releases rnp->lock. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2285  }
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2286  =


:::::: The code at line 2247 was first introduced by commit
:::::: 67c583a7de3433a971983490b37ad2bff3c55463 RCU: Privatize rcu_node::lo=
ck

:::::: TO: Boqun Feng <boqun.feng@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9214861624691864437==--


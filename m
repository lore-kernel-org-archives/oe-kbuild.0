Content-Type: multipart/mixed; boundary="===============0618915658276828611=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol 'm'
Date: Sat, 18 Jun 2022 07:55:58 +0800
Message-ID: <202206180728.h4brKRfa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0618915658276828611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/alph=
a/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol 'm'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: 521611f961a7dda92eefa26e1afd3914c06af64e [3/7] bitops: unify non-at=
omic bitops prototypes across architectures
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
config: alpha-randconfig-s031-20220617 (https://download.01.org/0day-ci/arc=
hive/20220618/202206180728.h4brKRfa-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/alobakin/linux/commit/521611f961a7dda92eefa26e=
1afd3914c06af64e
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout 521611f961a7dda92eefa26e1afd3914c06af64e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-nvidia-gpu.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/curre=
nt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-virtio.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ccgx-ucsi.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-pca-isa.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-viapro.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-tiny-usb.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ali1535.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-via.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis5595.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-taos-evm.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/thread_info.h, include/asm-generic/current=
.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-robotfuzz-osif.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd756.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-diolan-u2c.c:290:26: sparse: sparse: cast to rest=
ricted __le32
--
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-ocores.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis96x.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-piix4.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-amd8111.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-isch.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/cpumask.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-gpio.c: note: in included file (through include/l=
inux/bitops.h, include/linux/thread_info.h, include/asm-generic/preempt.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-master.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/thread_info.h, include/asm-generi=
c/current.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-sis630.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-designware-pcidrv.c: note: in included file (thro=
ugh include/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, =
...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:52:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:54:10: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:50:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:88:9: sparse: sparse: unreplaced symbol =
'm'
   arch/alpha/include/asm/bitops.h:90:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:86:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:124:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:126:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:122:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/alpha/include/asm/bitops.h:192:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:193:9: sparse: sparse: unreplaced symbol=
 'm'
>> arch/alpha/include/asm/bitops.h:194:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:196:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:196:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:196:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:197:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:197:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:190:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:236:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:237:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:240:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:240:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:240:21: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:241:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:241:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:234:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:278:9: sparse: sparse: unreplaced symbol=
 'mask'
   arch/alpha/include/asm/bitops.h:279:9: sparse: sparse: unreplaced symbol=
 'm'
   arch/alpha/include/asm/bitops.h:280:9: sparse: sparse: unreplaced symbol=
 'old'
   arch/alpha/include/asm/bitops.h:282:10: sparse: sparse: unreplaced symbo=
l 'm'
   arch/alpha/include/asm/bitops.h:282:14: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:282:20: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:17: sparse: sparse: unreplaced symbo=
l 'old'
   arch/alpha/include/asm/bitops.h:283:23: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/alpha/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:276:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/alpha/include/asm/bitops.h:289:9: sparse: sparse: unreplaced symbol=
 'return'
   arch/alpha/include/asm/bitops.h:287:1: sparse: sparse: unreplaced symbol=
 'return'
   drivers/i2c/busses/i2c-emev2.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'

vim +/m +52 arch/alpha/include/asm/bitops.h

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   45  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   46  /*
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   47   * WARNING: non atomic version.
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   48   */
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   49  static __always_inline void
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  @50  arch___set_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   51  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  @52  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   53  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   54  	*m |=3D 1 << (nr & 31);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   55  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   56  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   57  static inline void
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   58  clear_bit(unsigned long nr, volatile void * addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   59  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   60  	unsigned long temp;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   61  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   62  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   63  	__asm__ __volatile__(
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   64  	"1:	ldl_l %0,%3\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   65  	"	bic %0,%2,%0\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   66  	"	stl_c %0,%1\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   67  	"	beq %0,2f\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   68  	".subsection 2\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   69  	"2:	br 1b\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   70  	".previous"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   71  	:"=3D&r" (temp), "=3Dm" (*m)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   72  	:"Ir" (1UL << (nr & 31)), "m" (*m));
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   73  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   74  =

44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   75  static inline void
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   76  clear_bit_unlock(unsigned long nr, volatile void * addr)
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   77  {
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   78  	smp_mb();
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   79  	clear_bit(nr, addr);
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   80  }
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   81  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   82  /*
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   83   * WARNING: non atomic version.
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   84   */
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   85  static __always_inline void
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   86  arch___clear_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   87  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   88  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   89  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   90  	*m &=3D ~(1 << (nr & 31));
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   91  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
   92  =

44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   93  static inline void
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   94  __clear_bit_unlock(unsigned long nr, volatile void * addr)
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   95  {
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   96  	smp_mb();
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   97  	arch___clear_bit(nr, addr);
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   98  }
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
   99  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  100  static inline void
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  101  change_bit(unsigned long nr, volatile void * addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  102  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  103  	unsigned long temp;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  104  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  105  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  106  	__asm__ __volatile__(
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  107  	"1:	ldl_l %0,%3\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  108  	"	xor %0,%2,%0\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  109  	"	stl_c %0,%1\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  110  	"	beq %0,2f\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  111  	".subsection 2\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  112  	"2:	br 1b\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  113  	".previous"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  114  	:"=3D&r" (temp), "=3Dm" (*m)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  115  	:"Ir" (1UL << (nr & 31)), "m" (*m));
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  116  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  117  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  118  /*
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  119   * WARNING: non atomic version.
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  120   */
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  121  static __always_inline void
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  122  arch___change_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  123  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  124  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  125  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
 @126  	*m ^=3D 1 << (nr & 31);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  127  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  128  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  129  static inline int
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  130  test_and_set_bit(unsigned long nr, volatile void *addr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  131  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  132  	unsigned long oldbit;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  133  	unsigned long temp;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  134  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  135  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  136  	__asm__ __volatile__(
7c29ca5b8d1328 include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  137  #ifdef CONFIG_SMP
7c29ca5b8d1328 include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  138  	"	mb\n"
7c29ca5b8d1328 include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  139  #endif
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  140  	"1:	ldl_l %0,%4\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  141  	"	and %0,%3,%2\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  142  	"	bne %2,2f\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  143  	"	xor %0,%3,%0\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  144  	"	stl_c %0,%1\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  145  	"	beq %0,3f\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  146  	"2:\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  147  #ifdef CONFIG_SMP
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  148  	"	mb\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  149  #endif
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  150  	".subsection 2\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  151  	"3:	br 1b\n"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  152  	".previous"
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  153  	:"=3D&r" (temp), "=3Dm" (*m), "=3D&r" (oldbit)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  154  	:"Ir" (1UL << (nr & 31)), "m" (*m) : "memory");
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  155  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  156  	return oldbit !=3D 0;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  157  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  158  =

44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  159  static inline int
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  160  test_and_set_bit_lock(unsigned long nr, volatile void *addr)
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  161  {
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  162  	unsigned long oldbit;
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  163  	unsigned long temp;
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  164  	int *m =3D ((int *) addr) + (nr >> 5);
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  165  =

44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  166  	__asm__ __volatile__(
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  167  	"1:	ldl_l %0,%4\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  168  	"	and %0,%3,%2\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  169  	"	bne %2,2f\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  170  	"	xor %0,%3,%0\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  171  	"	stl_c %0,%1\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  172  	"	beq %0,3f\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  173  	"2:\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  174  #ifdef CONFIG_SMP
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  175  	"	mb\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  176  #endif
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  177  	".subsection 2\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  178  	"3:	br 1b\n"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  179  	".previous"
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  180  	:"=3D&r" (temp), "=3Dm" (*m), "=3D&r" (oldbit)
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  181  	:"Ir" (1UL << (nr & 31)), "m" (*m) : "memory");
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  182  =

44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  183  	return oldbit !=3D 0;
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  184  }
44086d5286c57c include/asm-alpha/bitops.h      Nicholas Piggin   2007-10-18=
  185  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  186  /*
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  187   * WARNING: non atomic version.
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  188   */
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  189  static __always_inline bool
521611f961a7dd arch/alpha/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  190  arch___test_and_set_bit(unsigned long nr, volatile unsigned long *ad=
dr)
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  191  {
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
 @192  	unsigned long mask =3D 1 << (nr & 0x1f);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  193  	int *m =3D ((int *) addr) + (nr >> 5);
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
 @194  	int old =3D *m;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  195  =

^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  196  	*m =3D old | mask;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  197  	return (old & mask) !=3D 0;
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  198  }
^1da177e4c3f41 include/asm-alpha/bitops.h      Linus Torvalds    2005-04-16=
  199  =


:::::: The code at line 52 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0618915658276828611==--


Content-Type: multipart/mixed; boundary="===============7959281464876673156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/usb/mixer_scarlett_gen2.c:211:8: warning: Excessive padding in 'struct scarlett2_port' (10 padding bytes, where 2 is optimal).
Date: Wed, 16 Mar 2022 11:35:16 +0800
Message-ID: <202203161138.dvyr6t3d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7959281464876673156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Geoffrey D. Bennett" <g@b4.vu>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: e2cc91ac8f4e1b03a0e3e822c338401284c0b550 ALSA: usb-audio: scarlett2=
: Split struct scarlett2_ports
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220316/202203161138.dvyr6t3d-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De2cc91ac8f4e1b03a0e3e822c338401284c0b550
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e2cc91ac8f4e1b03a0e3e822c338401284c0b550
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/nfs/nfs4xdr.c:1187:4: note: Null pointer value stored to 'p'
                   *p++ =3D cpu_to_be32(label->lfs);
                    ^~~
   fs/nfs/nfs4xdr.c:1187:8: note: Dereference of null pointer
                   *p++ =3D cpu_to_be32(label->lfs);
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:1367:2: warning: Value stored to 'p' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, nfs4_lock_length(args->fl));
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:1367:2: note: Value stored to 'p' is never read
           p =3D xdr_encode_hyper(p, nfs4_lock_length(args->fl));
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6768:17: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6767:11: note: Calling 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:3174:15: note: Assuming 'p' is null
           if (unlikely(!p))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/nfs/nfs4xdr.c:3174:2: note: Taking true branch
           if (unlikely(!p))
           ^
   fs/nfs/nfs4xdr.c:3175:3: note: Returning without writing to 'hdr->status'
                   return -EIO;
                   ^
   fs/nfs/nfs4xdr.c:6767:11: note: Returning from 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6768:17: note: Assigned value is garbage or undefined
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6795:17: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6794:11: note: Calling 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:3174:15: note: Assuming 'p' is null
           if (unlikely(!p))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/nfs/nfs4xdr.c:3174:2: note: Taking true branch
           if (unlikely(!p))
           ^
   fs/nfs/nfs4xdr.c:3175:3: note: Returning without writing to 'hdr->status'
                   return -EIO;
                   ^
   fs/nfs/nfs4xdr.c:6794:11: note: Returning from 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6795:17: note: Assigned value is garbage or undefined
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6826:17: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6825:11: note: Calling 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:3174:15: note: Assuming 'p' is null
           if (unlikely(!p))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/nfs/nfs4xdr.c:3174:2: note: Taking true branch
           if (unlikely(!p))
           ^
   fs/nfs/nfs4xdr.c:3175:3: note: Returning without writing to 'hdr->status'
                   return -EIO;
                   ^
   fs/nfs/nfs4xdr.c:6825:11: note: Returning from 'decode_compound_hdr'
           status =3D decode_compound_hdr(xdr, &hdr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:6826:17: note: Assigned value is garbage or undefined
           res->op_status =3D hdr.status;
                          ^ ~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/usb/mixer_quirks.c:309:3: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:309:3: note: Value stored to 'err' is never read
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> sound/usb/mixer_scarlett_gen2.c:211:8: warning: Excessive padding in 'st=
ruct scarlett2_port' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   src_descr, =

   dst_descr, =

   src_num_offset, =

   id, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct scarlett2_port {
   ~~~~~~~^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:211:8: note: Excessive padding in 'struc=
t scarlett2_port' (10 padding bytes, where 2 is optimal). Optimal fields or=
der: src_descr, dst_descr, src_num_offset, id, consider reordering the fiel=
ds or adding explicit padding members
   struct scarlett2_port {
   ~~~~~~~^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:884:3: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
                   u16 mixer_value =3D le16_to_cpu(data[i]);
                   ^
   sound/usb/mixer_scarlett_gen2.c:2482:6: note: Assuming field 'protocol' =
is not equal to 0
           if (!mixer->protocol)
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2482:2: note: Taking false branch
           if (!mixer->protocol)
           ^
   sound/usb/mixer_scarlett_gen2.c:2485:6: note: Assuming the condition is =
false
           if (!(chip->setup & SCARLETT2_ENABLE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2485:2: note: Taking false branch
           if (!(chip->setup & SCARLETT2_ENABLE)) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2500:8: note: Calling 'snd_scarlett_gen2=
_controls_create'
           err =3D snd_scarlett_gen2_controls_create(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2418:9: note: Assuming the condition is =
true
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
                  ^~~~~
   sound/usb/mixer_scarlett_gen2.c:2418:9: note: Left side of '&&' is true
   sound/usb/mixer_scarlett_gen2.c:2418:18: note: Assuming '(*info)->usb_id=
' is equal to 'mixer->chip->usb_id'
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2418:2: note: Loop condition is false. E=
xecution continues on line 2420
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
           ^
   sound/usb/mixer_scarlett_gen2.c:2420:2: note: Taking false branch
           if (!*info)
           ^
   sound/usb/mixer_scarlett_gen2.c:2425:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2425:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2430:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2430:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2434:8: note: Calling 'scarlett2_read_co=
nfigs'
           err =3D scarlett2_read_configs(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2221:6: note: Assuming field 'level_inpu=
t_count' is 0
           if (info->level_input_count) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2221:2: note: Taking false branch
           if (info->level_input_count) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2231:6: note: Assuming field 'pad_input_=
count' is 0
           if (info->pad_input_count) {
               ^~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2231:2: note: Taking false branch
           if (info->pad_input_count) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2242:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2242:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2246:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2246:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2249:6: note: Assuming field 'line_out_h=
w_vol' is 0
           if (info->line_out_hw_vol)
               ^~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2249:2: note: Taking false branch
           if (info->line_out_hw_vol)
           ^
   sound/usb/mixer_scarlett_gen2.c:2253:24: note: Assuming '__UNIQUE_ID___x=
380' is <=3D '__UNIQUE_ID___y381'
           private->master_vol =3D clamp(
                                 ^
   include/linux/minmax.h:95:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)

vim +211 sound/usb/mixer_scarlett_gen2.c

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  204  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  205  /* Description of each =
hardware port type:
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  206   * - id: hardware ID of=
 this port type
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  207   * - src_descr: printf =
format string for mux input selections
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  208   * - src_num_offset: ad=
ded to channel number for the fprintf
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  209   * - dst_descr: printf =
format string for mixer controls
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  210   */
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22 @211  struct scarlett2_port {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  212  	u16 id;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  213  	const char * const src=
_descr;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  214  	int src_num_offset;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  215  	const char * const dst=
_descr;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  216  };
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  217  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7959281464876673156==--


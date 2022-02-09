Content-Type: multipart/mixed; boundary="===============6993312486087717752=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/core/fbcon.c:1037:2: warning: Value stored to 'cap' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Feb 2022 07:49:53 +0800
Message-ID: <202202100713.8BFbxVCE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6993312486087717752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Helge Deller <deller@gmx.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: a3f781a9d6114c1d1e01defb7aa234dec45d2a5f fbcon: Add option to enabl=
e legacy hardware acceleration
date:   7 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220209 (https://download.01.org/0day-ci/arc=
hive/20220210/202202100713.8BFbxVCE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3f781a9d6114c1d1e01defb7aa234dec45d2a5f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3f781a9d6114c1d1e01defb7aa234dec45d2a5f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^  ~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/caif/cfrfml.c:223:14: warning: Access to field 'transmit' results in=
 a dereference of a null pointer (loaded from field 'dn') [clang-analyzer-c=
ore.NullDereference]
           caif_assert(layr->dn->transmit !=3D NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   net/caif/cfrfml.c:222:14: note: Assuming field 'dn' is equal to null
           caif_assert(layr->dn !=3D NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   net/caif/cfrfml.c:222:2: note: Taking true branch
           caif_assert(layr->dn !=3D NULL);
           ^
   include/net/caif/caif_layer.h:29:2: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
           ^
   net/caif/cfrfml.c:222:2: note: Loop condition is false.  Exiting loop
           caif_assert(layr->dn !=3D NULL);
           ^
   include/net/caif/caif_layer.h:30:3: note: expanded from macro 'caif_asse=
rt'
                   pr_err("caif:Assert detected:'%s'\n", #assert); \
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   net/caif/cfrfml.c:222:2: note: Taking true branch
           caif_assert(layr->dn !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/caif/cfrfml.c:222:2: note: Loop condition is false.  Exiting loop
           caif_assert(layr->dn !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FL=
AGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLA=
GS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   net/caif/cfrfml.c:222:2: note: Loop condition is false.  Exiting loop
           caif_assert(layr->dn !=3D NULL);
           ^
   include/net/caif/caif_layer.h:27:33: note: expanded from macro 'caif_ass=
ert'
   #define caif_assert(assert)                                     \
                                                                   ^
   net/caif/cfrfml.c:223:14: note: Access to field 'transmit' results in a =
dereference of a null pointer (loaded from field 'dn')
           caif_assert(layr->dn->transmit !=3D NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/video/fbdev/core/fbcon.c:1037:2: warning: Value stored to 'cap' =
is never read [clang-analyzer-deadcode.DeadStores]
           cap =3D info->flags;
           ^     ~~~~~~~~~~~
   drivers/video/fbdev/core/fbcon.c:1037:2: note: Value stored to 'cap' is =
never read
           cap =3D info->flags;
           ^     ~~~~~~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   include/linux/skbuff.h:2636:9: warning: Access to field 'head' results i=
n a dereference of a null pointer (loaded from variable 'skb') [clang-analy=
zer-core.NullDereference]
           return skb->head + skb->mac_header;
                  ^
   net/core/flow_dissector.c:935:6: note: Assuming 'data' is non-null
           if (!data) {
               ^~~~~
   net/core/flow_dissector.c:935:2: note: Taking false branch
           if (!data) {
           ^
   net/core/flow_dissector.c:977:6: note: Assuming 'skb' is null
           if (skb) {
               ^~~
   net/core/flow_dissector.c:977:2: note: Taking false branch
           if (skb) {
           ^
   net/core/flow_dissector.c:986:15: note: Assuming 'net' is null
           WARN_ON_ONCE(!net);
                        ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   net/core/flow_dissector.c:986:2: note: Taking true branch
           WARN_ON_ONCE(!net);
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/core/flow_dissector.c:986:2: note: Loop condition is false.  Exiting=
 loop
           WARN_ON_ONCE(!net);
           ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FL=
AGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLA=
GS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   net/core/flow_dissector.c:987:6: note: 'net' is null
           if (net) {
               ^~~
   net/core/flow_dissector.c:987:2: note: Taking false branch
           if (net) {
           ^
   net/core/flow_dissector.c:1026:6: note: Assuming the condition is true
           if (dissector_uses_key(flow_dissector,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/flow_dissector.c:1026:2: note: Taking true branch
           if (dissector_uses_key(flow_dissector,
           ^
   net/core/flow_dissector.c:1028:32: note: Passing null pointer value via =
1st parameter 'skb'
                   struct ethhdr *eth =3D eth_hdr(skb);
                                                ^~~
   net/core/flow_dissector.c:1028:24: note: Calling 'eth_hdr'
                   struct ethhdr *eth =3D eth_hdr(skb);
                                        ^~~~~~~~~~~~
   include/linux/if_ether.h:24:41: note: Passing null pointer value via 1st=
 parameter 'skb'
           return (struct ethhdr *)skb_mac_header(skb);
                                                  ^~~
   include/linux/if_ether.h:24:26: note: Calling 'skb_mac_header'
           return (struct ethhdr *)skb_mac_header(skb);

vim +/cap +1037 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1019  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1020  static void fbcon_init(struct vc_data *vc, int init)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1021  {
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1022  	struct fb_info *info;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1023  	struct fbcon_ops *ops;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1024  	struct vc_data **default_mode =3D vc->vc_display_fg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1025  	struct vc_data *svc =3D *default_mode;
50233393f0cf9b drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1026  	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye                 2=
020-11-12  1027  	int logo =3D 1, new_rows, new_cols, rows, cols;
87ab9f6b741734 drivers/video/fbdev/core/fbcon.c Helge Deller              2=
022-02-02  1028  	int cap, ret;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1029  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1030  	if (WARN_ON(info_idx =3D=3D -1))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1031  	    return;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2=
005-05-01  1032  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1033  	if (con2fb_map[vc->vc_num] =3D=3D -1)
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1034  		con2fb_map[vc->vc_num] =3D info_idx;
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1035  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1036  	info =3D registered_fb[con2fb_map[vc->vc_num]];
87ab9f6b741734 drivers/video/fbdev/core/fbcon.c Helge Deller              2=
022-02-02 @1037  	cap =3D info->flags;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2=
005-05-01  1038  =

3c5a1b111373e6 drivers/video/fbdev/core/fbcon.c Andreas Schwab            2=
019-05-06  1039  	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLE=
VEL_QUIET)
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2=
019-02-08  1040  		logo_shown =3D FBCON_LOGO_DONTSHOW;
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2=
019-02-08  1041  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1042  	if (vc !=3D svc || logo_shown =3D=3D FBCON_LOGO_DONTSHOW =
||
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1043  	    (info->fix.type =3D=3D FB_TYPE_TEXT))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1044  		logo =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1045  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1046  	if (var_to_display(p, &info->var, info))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1047  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1048  =

d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1049  	if (!info->fbcon_par)
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1050  		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1051  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1052  	/* If we are not the first console on this
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1053  	   fb, copy the font from that console */
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1054  	t =3D &fb_display[fg_console];
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1055  	if (!p->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1056  		if (t->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1057  			struct vc_data *fvc =3D vc_cons[fg_console].d;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1058  =

e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1059  			vc->vc_font.data =3D (void *)(p->fontdata =3D
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1060  						    fvc->vc_font.data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1061  			vc->vc_font.width =3D fvc->vc_font.width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1062  			vc->vc_font.height =3D fvc->vc_font.height;
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye                 2=
020-11-12  1063  			vc->vc_font.charcount =3D fvc->vc_font.charcount;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1064  			p->userfont =3D t->userfont;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1065  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1066  			if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1067  				REFCOUNT(p->fontdata)++;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1068  		} else {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1069  			const struct font_desc *font =3D NULL;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1070  =

e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1071  			if (!fontname[0] || !(font =3D find_font(fontname)))
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1072  				font =3D get_default_font(info->var.xres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1073  							info->var.yres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1074  							info->pixmap.blit_x,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1075  							info->pixmap.blit_y);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1076  			vc->vc_font.width =3D font->width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1077  			vc->vc_font.height =3D font->height;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1078  			vc->vc_font.data =3D (void *)(p->fontdata =3D font->dat=
a);
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye                 2=
020-11-12  1079  			vc->vc_font.charcount =3D font->charcount;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1080  		}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1081  	}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1082  =

b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-09-09  1083  	vc->vc_can_do_color =3D (fb_get_color_depth(&info->var, &=
info->fix)!=3D1);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1084  	vc->vc_complement_mask =3D vc->vc_can_do_color ? 0x7700 :=
 0x0800;
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye                 2=
020-11-12  1085  	if (vc->vc_font.charcount =3D=3D 256) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1086  		vc->vc_hi_font_mask =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1087  	} else {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1088  		vc->vc_hi_font_mask =3D 0x100;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1089  		if (vc->vc_can_do_color)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1090  			vc->vc_complement_mask <<=3D 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1091  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1092  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1093  	if (!*svc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1094  		con_set_default_unimap(svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1095  	if (!*vc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1096  		con_copy_unimap(vc, svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1097  =

e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1098  	ops =3D info->fbcon_par;
f235f664a8afab drivers/video/console/fbcon.c    Scot Doyle                2=
015-10-09  1099  	ops->cur_blink_jiffies =3D msecs_to_jiffies(vc->vc_cur_bl=
ink_ms);
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1100  =

2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz            2=
008-02-06  1101  	p->con_rotate =3D initial_rotation;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1102  	if (p->con_rotate =3D=3D -1)
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1103  		p->con_rotate =3D info->fbcon_rotate_hint;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1104  	if (p->con_rotate =3D=3D -1)
f2f4946b0adfd6 drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1105  		p->con_rotate =3D FB_ROTATE_UR;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1106  =

b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-01-09  1107  	set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1108  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1109  	cols =3D vc->vc_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1110  	rows =3D vc->vc_rows;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1111  	new_cols =3D FBCON_SWAP(ops->rotate, info->var.xres, info=
->var.yres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1112  	new_rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info=
->var.xres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1113  	new_cols /=3D vc->vc_font.width;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1114  	new_rows /=3D vc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1115  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1116  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1117  	 * We must always set the mode. The mode of the previous =
console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1118  	 * driver could be in the same resolution but we are usin=
g different
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1119  	 * hardware so we have to initialize the hardware.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1120  	 *
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1121  	 * We need to do it in fbcon_init() to prevent screen cor=
ruption.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1122  	 */
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby                2=
016-06-23  1123  	if (con_is_visible(vc) && vc->vc_mode =3D=3D KD_TEXT) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1124  		if (info->fbops->fb_set_par &&
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1125  		    !(ops->flags & FBCON_FLAGS_INIT)) {
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1126  			ret =3D info->fbops->fb_set_par(info);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1127  =

0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1128  			if (ret)
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1129  				printk(KERN_ERR "fbcon_init: detected "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1130  					"unhandled fb_set_par error, "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1131  					"error code %d\n", ret);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1132  		}
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1133  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1134  		ops->flags |=3D FBCON_FLAGS_INIT;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1135  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1136  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1137  	ops->graphics =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1138  =


:::::: The code at line 1037 was first introduced by commit
:::::: 87ab9f6b7417349aa197a6c7098d4fdd4beebb74 Revert "fbcon: Disable acce=
lerated scrolling"

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6993312486087717752==--


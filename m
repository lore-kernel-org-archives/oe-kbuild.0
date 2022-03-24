Content-Type: multipart/mixed; boundary="===============7909234177510340686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 7/7] lib/dynamic_debug.c:619:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 24 Mar 2022 16:04:57 +0800
Message-ID: <202203241546.NpAh68vY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7909234177510340686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   22bba015b8a58611271e876b5d39c27fdaaba1df
commit: 22bba015b8a58611271e876b5d39c27fdaaba1df [7/7] dyndbg: WIP use symb=
olic class names
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-c006-20220323 (https://download.01.org/0day-ci/arc=
hive/20220324/202203241546.NpAh68vY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jimc/linux/commit/22bba015b8a58611271e876b5d39=
c27fdaaba1df
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dyndbg-next
        git checkout 22bba015b8a58611271e876b5d39c27fdaaba1df
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   lib/packing.c:57:14: warning: The result of the right shift is undefined=
 due to shifting by '64', which is greater or equal to the width of type 'u=
nsigned long long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *box_mask =3D GENMASK_ULL(new_box_start_bit, new_box_end_bit);
                       ^
   include/linux/bits.h:44:31: note: expanded from macro 'GENMASK_ULL'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
                                        ^
   include/linux/bits.h:42:12: note: expanded from macro '__GENMASK_ULL'
            (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
                     ^
   lib/packing.c:102:6: note: Assuming 'startbit' is >=3D 'endbit'
           if (startbit < endbit)
               ^~~~~~~~~~~~~~~~~
   lib/packing.c:102:2: note: Taking false branch
           if (startbit < endbit)
           ^
   lib/packing.c:107:6: note: Assuming 'value_width' is <=3D 64
           if (value_width > 64)
               ^~~~~~~~~~~~~~~~
   lib/packing.c:107:2: note: Taking false branch
           if (value_width > 64)
           ^
   lib/packing.c:114:6: note: Assuming 'op' is not equal to PACK
           if (op =3D=3D PACK && value_width < 64 && (*uval >=3D (1ull << v=
alue_width)))
               ^~~~~~~~~~
   lib/packing.c:114:17: note: Left side of '&&' is false
           if (op =3D=3D PACK && value_width < 64 && (*uval >=3D (1ull << v=
alue_width)))
                          ^
   lib/packing.c:122:6: note: Assuming 'op' is not equal to UNPACK
           if (op =3D=3D UNPACK)
               ^~~~~~~~~~~~
   lib/packing.c:122:2: note: Taking false branch
           if (op =3D=3D UNPACK)
           ^
   lib/packing.c:132:32: note: Assuming 'box' is >=3D 'plogical_last_u8'
           for (box =3D plogical_first_u8; box >=3D plogical_last_u8; box--=
) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:132:2: note: Loop condition is true.  Entering loop body
           for (box =3D plogical_first_u8; box >=3D plogical_last_u8; box--=
) {
           ^
   lib/packing.c:144:7: note: 'box' is equal to 'plogical_first_u8'
                   if (box =3D=3D plogical_first_u8)
                       ^~~
   lib/packing.c:144:3: note: Taking true branch
                   if (box =3D=3D plogical_first_u8)
                   ^
   lib/packing.c:148:7: note: Assuming 'box' is not equal to 'plogical_last=
_u8'
                   if (box =3D=3D plogical_last_u8)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:148:3: note: Taking false branch
                   if (box =3D=3D plogical_last_u8)
                   ^
   lib/packing.c:171:7: note: Assuming the condition is false
                   if (quirks & QUIRK_LITTLE_ENDIAN)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:171:3: note: Taking false branch
                   if (quirks & QUIRK_LITTLE_ENDIAN)
                   ^
   lib/packing.c:173:7: note: Assuming the condition is false
                   if (quirks & QUIRK_LSW32_IS_FIRST)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:173:3: note: Taking false branch
                   if (quirks & QUIRK_LSW32_IS_FIRST)
                   ^
   lib/packing.c:177:7: note: 'op' is not equal to UNPACK
                   if (op =3D=3D UNPACK) {
                       ^~
   lib/packing.c:177:3: note: Taking false branch
                   if (op =3D=3D UNPACK) {
                   ^
   lib/packing.c:198:8: note: Assuming the condition is true
                           if (quirks & QUIRK_MSB_ON_THE_RIGHT)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:198:4: note: Taking true branch
                           if (quirks & QUIRK_MSB_ON_THE_RIGHT)
                           ^
   lib/packing.c:199:5: note: Calling 'adjust_for_msb_right_quirk'
                                   adjust_for_msb_right_quirk(&pval,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/packing.c:57:14: note: The result of the right shift is undefined du=
e to shifting by '64', which is greater or equal to the width of type 'unsi=
gned long long'
           *box_mask =3D GENMASK_ULL(new_box_start_bit, new_box_end_bit);
                       ^
   include/linux/bits.h:44:31: note: expanded from macro 'GENMASK_ULL'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
                                        ^~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:42:12: note: expanded from macro '__GENMASK_ULL'
            (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
                     ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> lib/dynamic_debug.c:619:14: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
                   } else if (*(p - 1) =3D=3D '!') {
                              ^
   lib/dynamic_debug.c:662:6: note: Assuming 'dcp' is non-null
           if (!dcp) {
               ^~~~
   lib/dynamic_debug.c:662:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:667:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   lib/dynamic_debug.c:667:2: note: Taking true branch
           if (rc)
           ^
   lib/dynamic_debug.c:669:10: note: Calling 'param_set_dyndbg_classes'
                   return param_set_dyndbg_classes(instr, kp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:603:7: note: 'dcp' is non-null
           if (!dcp) {
                ^~~
   lib/dynamic_debug.c:603:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:607:6: note: Assuming field 'class_names' is non-null
           if (!dcp->class_names) {
               ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:607:2: note: Taking false branch
           if (!dcp->class_names) {
           ^
   lib/dynamic_debug.c:613:7: note: Value assigned to 'p'
           for (p =3D strchr(cls, ','); cls; cls =3D strchr(p, ',')) {
                ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:613:2: note: Loop condition is true.  Entering loop =
body
           for (p =3D strchr(cls, ','); cls; cls =3D strchr(p, ',')) {
           ^
   lib/dynamic_debug.c:614:7: note: Assuming 'p' is null
                   if (p)
                       ^
   lib/dynamic_debug.c:614:3: note: Taking false branch
                   if (p)
                   ^
   lib/dynamic_debug.c:616:7: note: Assuming the condition is false
                   if (*cls =3D=3D '!') {
                       ^~~~~~~~~~~
   lib/dynamic_debug.c:616:3: note: Taking false branch
                   if (*cls =3D=3D '!') {
                   ^
   lib/dynamic_debug.c:619:14: note: Dereference of null pointer
                   } else if (*(p - 1) =3D=3D '!') {
                              ^~~~~~~~
   lib/dynamic_debug.c:629:14: warning: The left operand of '=3D=3D' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (negate =3D=3D test_bit(idx_rc, dcp->bits))
                              ^
   lib/dynamic_debug.c:662:6: note: Assuming 'dcp' is non-null
           if (!dcp) {
               ^~~~
   lib/dynamic_debug.c:662:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:667:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   lib/dynamic_debug.c:667:2: note: Taking true branch
           if (rc)
           ^
   lib/dynamic_debug.c:669:10: note: Calling 'param_set_dyndbg_classes'
                   return param_set_dyndbg_classes(instr, kp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:600:2: note: 'negate' declared without an initial va=
lue
           bool negate;
           ^~~~~~~~~~~
   lib/dynamic_debug.c:603:7: note: 'dcp' is non-null
           if (!dcp) {
                ^~~
   lib/dynamic_debug.c:603:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:607:6: note: Assuming field 'class_names' is non-null
           if (!dcp->class_names) {
               ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:607:2: note: Taking false branch
           if (!dcp->class_names) {
           ^
   lib/dynamic_debug.c:613:2: note: Loop condition is true.  Entering loop =
body
           for (p =3D strchr(cls, ','); cls; cls =3D strchr(p, ',')) {
           ^
   lib/dynamic_debug.c:614:7: note: Assuming 'p' is non-null
                   if (p)
                       ^
   lib/dynamic_debug.c:614:3: note: Taking true branch
                   if (p)
                   ^
   lib/dynamic_debug.c:616:7: note: Assuming the condition is false
                   if (*cls =3D=3D '!') {
                       ^~~~~~~~~~~
   lib/dynamic_debug.c:616:3: note: Taking false branch
                   if (*cls =3D=3D '!') {
                   ^
   lib/dynamic_debug.c:619:10: note: Taking false branch
                   } else if (*(p - 1) =3D=3D '!') {
                          ^
   lib/dynamic_debug.c:624:7: note: Assuming 'idx_rc' is >=3D 0
                   if (idx_rc < 0) {
                       ^~~~~~~~~~
   lib/dynamic_debug.c:624:3: note: Taking false branch
                   if (idx_rc < 0) {
                   ^
   lib/dynamic_debug.c:629:14: note: The left operand of '=3D=3D' is a garb=
age value
                   if (negate =3D=3D test_bit(idx_rc, dcp->bits))
                       ~~~~~~ ^
>> lib/dynamic_debug.c:640:13: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
           *dcp->bits =3D inbits;
                      ^
   lib/dynamic_debug.c:662:6: note: Assuming 'dcp' is non-null
           if (!dcp) {
               ^~~~
   lib/dynamic_debug.c:662:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:667:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   lib/dynamic_debug.c:667:2: note: Taking true branch
           if (rc)
           ^
   lib/dynamic_debug.c:669:10: note: Calling 'param_set_dyndbg_classes'
                   return param_set_dyndbg_classes(instr, kp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:596:2: note: 'inbits' declared without an initial va=
lue
           unsigned long inbits;
           ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:603:7: note: 'dcp' is non-null
           if (!dcp) {
                ^~~
   lib/dynamic_debug.c:603:2: note: Taking false branch
           if (!dcp) {
           ^
   lib/dynamic_debug.c:607:6: note: Assuming field 'class_names' is non-null
           if (!dcp->class_names) {
               ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:607:2: note: Taking false branch
           if (!dcp->class_names) {
           ^
   lib/dynamic_debug.c:613:2: note: Loop condition is false. Execution cont=
inues on line 640
           for (p =3D strchr(cls, ','); cls; cls =3D strchr(p, ',')) {
           ^
   lib/dynamic_debug.c:640:13: note: Assigned value is garbage or undefined
           *dcp->bits =3D inbits;
                      ^ ~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/nilfs2/segment.c:1597:4: warning: Called function pointer is null (nu=
ll dereference) [clang-analyzer-core.CallAndMessage]
                           sc_op->write_node_binfo(sci, &ssp, &binfo);
                           ^
   fs/nilfs2/segment.c:1619:2: note: Loop condition is true.  Entering loop=
 body
           list_for_each_entry(segbuf, &sci->sc_segbufs, sb_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/nilfs2/segment.c:1620:9: note: Calling 'nilfs_segctor_update_payload_=
blocknr'
                   err =3D nilfs_segctor_update_payload_blocknr(sci, segbuf=
, mode);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/segment.c:1558:6: note: Assuming 'nfinfo' is not equal to 0
           if (!nfinfo)
               ^~~~~~~
   fs/nilfs2/segment.c:1558:2: note: Taking false branch
           if (!nfinfo)
           ^
   fs/nilfs2/segment.c:1565:2: note: Loop condition is true.  Entering loop=
 body
           list_for_each_entry(bh, &segbuf->sb_payload_buffers, b_assoc_buf=
fers) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/nilfs2/segment.c:1566:7: note: Assuming 'bh' is not equal to field 's=
b_super_root'
                   if (bh =3D=3D segbuf->sb_super_root)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/segment.c:1566:3: note: Taking false branch
                   if (bh =3D=3D segbuf->sb_super_root)
                   ^
   fs/nilfs2/segment.c:1568:8: note: 'finfo' is null
                   if (!finfo) {
                        ^~~~~
   fs/nilfs2/segment.c:1568:3: note: Taking true branch
                   if (!finfo) {
                   ^
   fs/nilfs2/segment.c:1577:8: note: Assuming 'mode' is equal to SC_LSEG_DS=
YNC
                           if (mode =3D=3D SC_LSEG_DSYNC)
                               ^~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/segment.c:1577:4: note: Taking true branch
                           if (mode =3D=3D SC_LSEG_DSYNC)
                           ^
   fs/nilfs2/segment.c:1588:7: note: Assuming 'bh' is equal to 'bh_org'
                   if (bh !=3D bh_org)
                       ^~~~~~~~~~~~
   fs/nilfs2/segment.c:1588:3: note: Taking false branch
                   if (bh !=3D bh_org)
                   ^
   fs/nilfs2/segment.c:1591:7: note: Assuming 'err' is 0
                   if (unlikely(err))
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/nilfs2/segment.c:1591:3: note: Taking false branch
                   if (unlikely(err))

vim +619 lib/dynamic_debug.c

22bba015b8a586 Jim Cromie 2022-03-21  593  =

22bba015b8a586 Jim Cromie 2022-03-21  594  static int param_set_dyndbg_clas=
ses(const char *instr, const struct kernel_param *kp)
22bba015b8a586 Jim Cromie 2022-03-21  595  {
22bba015b8a586 Jim Cromie 2022-03-21  596  	unsigned long inbits;
22bba015b8a586 Jim Cromie 2022-03-21  597  	int idx_rc, matches =3D 0, totc=
t =3D 0;
22bba015b8a586 Jim Cromie 2022-03-21  598  	char query[FMT_QUERY_SIZE];
22bba015b8a586 Jim Cromie 2022-03-21  599  	struct dyndbg_classbits_param *=
dcp =3D kp->arg;
22bba015b8a586 Jim Cromie 2022-03-21  600  	bool negate;
22bba015b8a586 Jim Cromie 2022-03-21  601  	char *cls, *p;
22bba015b8a586 Jim Cromie 2022-03-21  602  =

22bba015b8a586 Jim Cromie 2022-03-21  603  	if (!dcp) {
22bba015b8a586 Jim Cromie 2022-03-21  604  		pr_err("set_dyndbg_classbits: =
no bits=3D>queries map\n");
22bba015b8a586 Jim Cromie 2022-03-21  605  		return -EINVAL;
22bba015b8a586 Jim Cromie 2022-03-21  606  	}
22bba015b8a586 Jim Cromie 2022-03-21  607  	if (!dcp->class_names) {
22bba015b8a586 Jim Cromie 2022-03-21  608  		pr_err("module -get-classes: n=
o classes\n");
22bba015b8a586 Jim Cromie 2022-03-21  609  		return -EINVAL;
22bba015b8a586 Jim Cromie 2022-03-21  610  	}
22bba015b8a586 Jim Cromie 2022-03-21  611  	cls =3D kstrdup(instr, GFP_KERN=
EL);
22bba015b8a586 Jim Cromie 2022-03-21  612  =

22bba015b8a586 Jim Cromie 2022-03-21  613  	for (p =3D strchr(cls, ','); cl=
s; cls =3D strchr(p, ',')) {
22bba015b8a586 Jim Cromie 2022-03-21  614  		if (p)
22bba015b8a586 Jim Cromie 2022-03-21  615  			*p++ =3D 0; /* chop and advan=
ce on comma */
22bba015b8a586 Jim Cromie 2022-03-21  616  		if (*cls =3D=3D '!') {
22bba015b8a586 Jim Cromie 2022-03-21  617  			negate =3D true;
22bba015b8a586 Jim Cromie 2022-03-21  618  			cls++;
22bba015b8a586 Jim Cromie 2022-03-21 @619  		} else if (*(p - 1) =3D=3D '!'=
) {
22bba015b8a586 Jim Cromie 2022-03-21  620  			negate =3D true;
22bba015b8a586 Jim Cromie 2022-03-21  621  			*(p - 1) =3D '0';
22bba015b8a586 Jim Cromie 2022-03-21  622  		}
22bba015b8a586 Jim Cromie 2022-03-21  623  		idx_rc =3D match_string(dcp->c=
lass_names, _DPRINTK_CLASS_DFLT, cls);
22bba015b8a586 Jim Cromie 2022-03-21  624  		if (idx_rc < 0) {
22bba015b8a586 Jim Cromie 2022-03-21  625  			pr_err("%s not found for modu=
le: %s\n",
22bba015b8a586 Jim Cromie 2022-03-21  626  			       cls, dcp->owner->name);
22bba015b8a586 Jim Cromie 2022-03-21  627  			return idx_rc;
22bba015b8a586 Jim Cromie 2022-03-21  628  		}
22bba015b8a586 Jim Cromie 2022-03-21  629  		if (negate =3D=3D test_bit(idx=
_rc, dcp->bits))
22bba015b8a586 Jim Cromie 2022-03-21  630  			continue;
22bba015b8a586 Jim Cromie 2022-03-21  631  =

22bba015b8a586 Jim Cromie 2022-03-21  632  		snprintf(query, FMT_QUERY_SIZE=
, "class %s %c%s",
22bba015b8a586 Jim Cromie 2022-03-21  633  			 cls, !!negate ? '-' : '+', d=
cp->flags);
22bba015b8a586 Jim Cromie 2022-03-21  634  =

22bba015b8a586 Jim Cromie 2022-03-21  635  		matches =3D ddebug_exec_querie=
s(query, KP_MOD_NAME);
22bba015b8a586 Jim Cromie 2022-03-21  636  =

22bba015b8a586 Jim Cromie 2022-03-21  637  		v2pr_info("%d matches on class=
:%s\n", matches, cls);
22bba015b8a586 Jim Cromie 2022-03-21  638  		totct +=3D matches;
22bba015b8a586 Jim Cromie 2022-03-21  639  	}
22bba015b8a586 Jim Cromie 2022-03-21 @640  	*dcp->bits =3D inbits;
22bba015b8a586 Jim Cromie 2022-03-21  641  	vpr_info("total matches: %d\n",=
 totct);
22bba015b8a586 Jim Cromie 2022-03-21  642  	return 0;
22bba015b8a586 Jim Cromie 2022-03-21  643  }
22bba015b8a586 Jim Cromie 2022-03-21  644  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7909234177510340686==--


Content-Type: multipart/mixed; boundary="===============8760912275183610675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 44/62] drivers/media/i2c/kmb-imx327.c:1629:28: warning: Value stored to 'ctrl_hdlr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 May 2022 11:35:05 +0800
Message-ID: <202205291105.Wf3WI9fZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8760912275183610675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Zhou Furong <furong.zhou@intel.com>
CC: nanli2x <nanx.li@intel.com>

Hi Zhou,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   5308d498714872bc2f9957901da0c5c9569e9a78
commit: 49fa3e4bf70e3787f53ec225a1f9962598606bb9 [44/62] media: keembay-cam=
era: sync with API change
:::::: branch date: 6 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220529 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291105.Wf3WI9fZ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel/linux-intel-lts/commit/49fa3e4bf70e3787f=
53ec225a1f9962598606bb9
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 49fa3e4bf70e3787f53ec225a1f9962598606bb9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   dev_err(bus->dev,
                                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/soundwire/stream.c:820:5: note: Control jumps to line 847
                                   goto error;
                                   ^
   drivers/soundwire/stream.c:847:2: note: Left side of '&&' is false
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/soundwire/stream.c:847:2: note: Taking false branch
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/soundwire/stream.c:847:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:847:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:849:22: note: Field 'msg' is non-null
                   if (bus->defer_msg.msg) {
                                      ^
   drivers/soundwire/stream.c:849:3: note: Taking true branch
                   if (bus->defer_msg.msg) {
                   ^
   drivers/soundwire/stream.c:850:10: note: Use of memory after it is freed
                           kfree(bus->defer_msg.msg->buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/i2c/kmb-imx327.c:1629:28: warning: Value stored to 'ctrl_h=
dlr' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct v4l2_ctrl_handler *ctrl_hdlr =3D &kmb_imx327->ctrl_handle=
r;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/kmb-imx327.c:1629:28: note: Value stored to 'ctrl_hdlr=
' during its initialization is never read
           struct v4l2_ctrl_handler *ctrl_hdlr =3D &kmb_imx327->ctrl_handle=
r;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/i2c/kmb-flash.c:357:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/media/i2c/kmb-flash.c:357:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/i2c/kmb-lens.c:215:2: warning: Value stored to 'new_pos' i=
s never read [clang-analyzer-deadcode.DeadStores]
           new_pos =3D kmb_lens->iris_new_pos;
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/kmb-lens.c:215:2: note: Value stored to 'new_pos' is n=
ever read
           new_pos =3D kmb_lens->iris_new_pos;
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/of/unittest.c:3128:29: warning: Access to field 'properties' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
overlay_base_symbols') [clang-analyzer-core.NullDereference]
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:358:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   drivers/of/unittest.c:3039:2: note: 'overlay_base_symbols' declared with=
out an initial value
           struct device_node *overlay_base_symbols;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3044:6: note: Assuming 'overlay_base_root' is non-=
null
           if (!overlay_base_root) {
               ^~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3044:2: note: Taking false branch
           if (!overlay_base_root) {
           ^
   drivers/of/unittest.c:3068:2: note: Loop condition is false. Execution c=
ontinues on line 3077
           for (np =3D overlay_base_root->child; np; np =3D np->sibling) {
           ^
   drivers/of/unittest.c:3078:6: note: Assuming 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3078:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3081:3: note: Loop condition is false. Execution c=
ontinues on line 3091
                   for (np =3D overlay_base_root->child; np; np =3D np->sib=
ling) {
                   ^
   drivers/of/unittest.c:3091:44: note: Assuming 'np' is equal to null
           for_each_child_of_node(overlay_base_root, np) {
                                                     ^
   include/linux/of.h:1301:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/of/unittest.c:3091:2: note: Loop condition is false. Execution c=
ontinues on line 3110
           for_each_child_of_node(overlay_base_root, np) {
           ^
   include/linux/of.h:1301:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/of/unittest.c:3110:2: note: Loop condition is false. Execution c=
ontinues on line 3113
           for (np =3D overlay_base_root->child; np; np =3D np->sibling)
           ^
   drivers/of/unittest.c:3115:2: note: Loop condition is false. Execution c=
ontinues on line 3118
           for (last_sibling =3D np =3D of_root->child; np; np =3D np->sibl=
ing)
           ^
   drivers/of/unittest.c:3118:6: note: 'last_sibling' is null
           if (last_sibling)
               ^~~~~~~~~~~~
   drivers/of/unittest.c:3118:2: note: Taking false branch
           if (last_sibling)
           ^
   drivers/of/unittest.c:3123:2: note: Loop condition is false. Execution c=
ontinues on line 3126
           for_each_of_allnodes_from(overlay_base_root, np)
           ^
   include/linux/of.h:265:2: note: expanded from macro 'for_each_of_allnode=
s_from'
           for (dn =3D __of_find_all_nodes(from); dn; dn =3D __of_find_all_=
nodes(dn))
           ^
   drivers/of/unittest.c:3126:6: note: 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3126:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3128:29: note: Access to field 'properties' result=
s in a dereference of an undefined pointer value (loaded from variable 'ove=
rlay_base_symbols')
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:358:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   Suppressed 8 warnings (8 in non-user code).
--
                   ^
   drivers/media/i2c/ccs/ccs-data.c:548:11: note: Passing null pointer valu=
e via 2nd parameter 'pdaf_readout'
                                                              &rules->pdaf_=
readout,
                                                              ^~~~~~~~~~~~~=
~~~~~~~
   drivers/media/i2c/ccs/ccs-data.c:547:11: note: Calling 'ccs_data_parse_p=
daf_readout'
                           rval =3D ccs_data_parse_pdaf_readout(bin,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-data.c:412:6: note: Assuming the condition is =
false
           if (!is_contained(__pdaf, endp))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-data.c:412:2: note: Taking false branch
           if (!is_contained(__pdaf, endp))
           ^
   drivers/media/i2c/ccs/ccs-data.c:415:12: note: Field 'base' is non-null
           if (!bin->base) {
                     ^
   drivers/media/i2c/ccs/ccs-data.c:415:2: note: Taking false branch
           if (!bin->base) {
           ^
   drivers/media/i2c/ccs/ccs-data.c:418:17: note: Dereference of null point=
er (loaded from variable 'pdaf_readout')
                   *pdaf_readout =3D bin_alloc(bin, sizeof(**pdaf_readout));
                    ~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/of/unittest.c:3128:29: warning: Access to field 'properties' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
overlay_base_symbols') [clang-analyzer-core.NullDereference]
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:358:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   drivers/of/unittest.c:3039:2: note: 'overlay_base_symbols' declared with=
out an initial value
           struct device_node *overlay_base_symbols;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3044:6: note: Assuming 'overlay_base_root' is non-=
null
           if (!overlay_base_root) {
               ^~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3044:2: note: Taking false branch
           if (!overlay_base_root) {
           ^
   drivers/of/unittest.c:3068:2: note: Loop condition is false. Execution c=
ontinues on line 3077
           for (np =3D overlay_base_root->child; np; np =3D np->sibling) {
           ^
   drivers/of/unittest.c:3078:6: note: Assuming 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3078:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3081:3: note: Loop condition is false. Execution c=
ontinues on line 3091
                   for (np =3D overlay_base_root->child; np; np =3D np->sib=
ling) {
                   ^
   drivers/of/unittest.c:3091:44: note: Assuming 'np' is equal to null
           for_each_child_of_node(overlay_base_root, np) {
                                                     ^
   include/linux/of.h:1301:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/of/unittest.c:3091:2: note: Loop condition is false. Execution c=
ontinues on line 3110
           for_each_child_of_node(overlay_base_root, np) {
           ^
   include/linux/of.h:1301:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/of/unittest.c:3110:2: note: Loop condition is false. Execution c=
ontinues on line 3113
           for (np =3D overlay_base_root->child; np; np =3D np->sibling)
           ^
   drivers/of/unittest.c:3115:2: note: Loop condition is false. Execution c=
ontinues on line 3118
           for (last_sibling =3D np =3D of_root->child; np; np =3D np->sibl=
ing)
           ^
   drivers/of/unittest.c:3118:6: note: 'last_sibling' is null
           if (last_sibling)
               ^~~~~~~~~~~~
   drivers/of/unittest.c:3118:2: note: Taking false branch
           if (last_sibling)
           ^
   drivers/of/unittest.c:3123:2: note: Loop condition is false. Execution c=
ontinues on line 3126
           for_each_of_allnodes_from(overlay_base_root, np)
           ^
   include/linux/of.h:265:2: note: expanded from macro 'for_each_of_allnode=
s_from'
           for (dn =3D __of_find_all_nodes(from); dn; dn =3D __of_find_all_=
nodes(dn))
           ^
   drivers/of/unittest.c:3126:6: note: 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3126:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3128:29: note: Access to field 'properties' result=
s in a dereference of an undefined pointer value (loaded from variable 'ove=
rlay_base_symbols')
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:358:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/i2c/kmb-imx327.c:1629:28: warning: Value stored to 'ctrl_h=
dlr' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct v4l2_ctrl_handler *ctrl_hdlr =3D &kmb_imx327->ctrl_handle=
r;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/kmb-imx327.c:1629:28: note: Value stored to 'ctrl_hdlr=
' during its initialization is never read
           struct v4l2_ctrl_handler *ctrl_hdlr =3D &kmb_imx327->ctrl_handle=
r;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/i2c/kmb-flash.c:357:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/media/i2c/kmb-flash.c:357:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/i2c/kmb-lens.c:215:2: warning: Value stored to 'new_pos' i=
s never read [clang-analyzer-deadcode.DeadStores]
           new_pos =3D kmb_lens->iris_new_pos;
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/kmb-lens.c:215:2: note: Value stored to 'new_pos' is n=
ever read
           new_pos =3D kmb_lens->iris_new_pos;
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/lm73.c:76:62: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   drivers/hwmon/lm73.c:65:41: note: Left side of '&&' is false
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/lm73.c:65:41: note: Taking false branch
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/lm73.c:65:41: note: Loop condition is false.  Exiting loop
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/lm73.c:72:6: note: Assuming 'status' is >=3D 0

vim +/ctrl_hdlr +1629 drivers/media/i2c/kmb-imx327.c

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1620  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1621  /**
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1622   * kmb_imx327_init_con=
trols - Initialize sensor subdevice controls
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1623   * @kmb_imx327: pointe=
r to kmb_imx327 device
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1624   *
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1625   * Return: 0 if succes=
sful
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1626   */
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1627  static int kmb_imx327_=
init_controls(struct kmb_imx327 *kmb_imx327)
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1628  {
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26 @1629  	struct v4l2_ctrl_hand=
ler *ctrl_hdlr =3D &kmb_imx327->ctrl_handler;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1630  	const struct kmb_imx3=
27_mode *mode =3D kmb_imx327->cur_mode;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1631  	u32 hblank;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1632  	u32 vblank;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1633  	int ret;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1634  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1635  	ctrl_hdlr =3D &kmb_im=
x327->ctrl_handler;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1636  	ret =3D v4l2_ctrl_han=
dler_init(ctrl_hdlr, 9);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1637  	if (ret)
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1638  		return ret;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1639  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1640  	/* Serialize controls=
 with sensor device */
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1641  	ctrl_hdlr->lock =3D &=
kmb_imx327->mutex;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1642  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1643  	/* Initialize exposur=
e and gain */
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1644  	kmb_imx327->exp_ctrl =
=3D v4l2_ctrl_new_std(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1645  						 &kmb_imx327_ctr=
l_ops,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1646  						 V4L2_CID_EXPOSU=
RE,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1647  						 KMB_IMX327_EXPO=
SURE_MIN,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1648  						 mode->lpfr[0],
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1649  						 KMB_IMX327_EXPO=
SURE_STEP,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1650  						 KMB_IMX327_EXPO=
SURE_DEFAULT);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1651  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1652  	kmb_imx327->again_ctr=
l =3D v4l2_ctrl_new_std(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1653  						   &kmb_imx327_c=
trl_ops,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1654  						   V4L2_CID_ANAL=
OGUE_GAIN,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1655  						   KMB_IMX327_AG=
AIN_MIN,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1656  						   KMB_IMX327_AG=
AIN_MAX,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1657  						   KMB_IMX327_AG=
AIN_STEP,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1658  						   KMB_IMX327_AG=
AIN_DEFAULT);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1659  	kmb_imx327->exp1_ctrl=
 =3D v4l2_ctrl_new_custom(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1660  						     &exposure_s=
hort,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1661  						     NULL);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1662  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1663  	kmb_imx327->again1_ct=
rl =3D v4l2_ctrl_new_custom(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1664  						       &again_sh=
ort,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1665  						       NULL);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1666  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1667  	kmb_imx327->exp2_ctrl=
 =3D v4l2_ctrl_new_custom(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1668  						     &exposure_v=
ery_short,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1669  						     NULL);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1670  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1671  	kmb_imx327->again2_ct=
rl =3D v4l2_ctrl_new_custom(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1672  						       &again_ve=
ry_short,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1673  						       NULL);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1674  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1675  	v4l2_ctrl_cluster(6, =
&kmb_imx327->exp_ctrl);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1676  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1677  	/* Read only controls=
 */
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1678  	kmb_imx327->pclk_ctrl=
 =3D v4l2_ctrl_new_std(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1679  						  &kmb_imx327_ct=
rl_ops,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1680  						  V4L2_CID_PIXEL=
_RATE,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1681  						  mode->pclk, mo=
de->pclk,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1682  						  1, mode->pclk);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1683  	if (kmb_imx327->pclk_=
ctrl)
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1684  		kmb_imx327->pclk_ctr=
l->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1685  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1686  	vblank =3D mode->lpfr=
[0] - mode->height;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1687  	kmb_imx327->vblank_ct=
rl =3D v4l2_ctrl_new_std(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1688  						    &kmb_imx327_=
ctrl_ops,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1689  						    V4L2_CID_VBL=
ANK,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1690  						    KMB_IMX327_R=
EG_MIN,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1691  						    KMB_IMX327_R=
EG_MAX,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1692  						    1, vblank);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1693  	if (kmb_imx327->vblan=
k_ctrl)
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1694  		kmb_imx327->vblank_c=
trl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1695  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1696  	hblank =3D mode->ppln=
 - mode->width;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1697  	kmb_imx327->hblank_ct=
rl =3D v4l2_ctrl_new_std(ctrl_hdlr,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1698  						    &kmb_imx327_=
ctrl_ops,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1699  						    V4L2_CID_HBL=
ANK,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1700  						    KMB_IMX327_R=
EG_MIN,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1701  						    KMB_IMX327_R=
EG_MAX,
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1702  						    1, hblank);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1703  	if (kmb_imx327->hblan=
k_ctrl)
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1704  		kmb_imx327->hblank_c=
trl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1705  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1706  	if (ctrl_hdlr->error)=
 {
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1707  		ret =3D ctrl_hdlr->e=
rror;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1708  		dev_err(kmb_imx327->=
dev, "control init failed: %d", ret);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1709  		goto error;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1710  	}
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1711  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1712  	kmb_imx327->sd.ctrl_h=
andler =3D ctrl_hdlr;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1713  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1714  	return 0;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1715  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1716  error:
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1717  	v4l2_ctrl_handler_fre=
e(ctrl_hdlr);
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1718  =

ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1719  	return ret;
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1720  }
ca29c95cf4cd93 Gjorgji Rosikopulos 2020-06-26  1721  =


:::::: The code at line 1629 was first introduced by commit
:::::: ca29c95cf4cd93d1e33013951d9ab731e49e1bce media: kmb-imx327-sensor: A=
dd Keem Bay IMX327 sensor

:::::: TO: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
:::::: CC: nanli2x <nanx.li@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8760912275183610675==--


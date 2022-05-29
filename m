Content-Type: multipart/mixed; boundary="===============1615688835533311702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] drivers/edac/edac_mc.c:1155:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provid...
Date: Mon, 30 May 2022 02:59:25 +0800
Message-ID: <202205300258.ctHXLrDa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1615688835533311702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   13491710253d86e7fa5deb854bd304b1dd06ab9e
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
530/202205300258.ctHXLrDa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   drivers/edac/edac_mc.c:1119:4: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                           strcpy(p, dimm->label);
                           ^~~~~~
   drivers/edac/edac_mc.c:1152:14: warning: The left operand of '<' is a ga=
rbage value due to array index out of bounds [clang-analyzer-core.Undefined=
BinaryOperatorResult]
                   if (pos[i] < 0)
                       ~~~~~~ ^
   drivers/edac/edac_mc.c:1035:2: note: Taking false branch
           edac_dbg(3, "MC%d\n", mci->mc_idx);
           ^
   drivers/edac/edac_mc.h:84:2: note: expanded from macro 'edac_dbg'
           if (0)                                                          \
           ^
   drivers/edac/edac_mc.c:1035:2: note: Loop condition is false.  Exiting l=
oop
           edac_dbg(3, "MC%d\n", mci->mc_idx);
           ^
   drivers/edac/edac_mc.h:82:39: note: expanded from macro 'edac_dbg'
   #define edac_dbg(level, fmt, ...)                                       \
                                                                           ^
   drivers/edac/edac_mc.c:1048:11: note: '?' condition is true
           e->msg =3D msg ?: "";
                    ^
   drivers/edac/edac_mc.c:1049:20: note: '?' condition is true
           e->other_detail =3D other_detail ?: "";
                             ^
   drivers/edac/edac_mc.c:1056:14: note: Assuming 'i' is >=3D field 'n_laye=
rs'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1056:2: note: Loop condition is false. Execution =
continues on line 1086
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1089:2: note: Loop condition is false. Execution =
continues on line 1141
           mci_for_each_dimm(mci, dimm) {
           ^
   include/linux/edac.h:600:2: note: expanded from macro 'mci_for_each_dimm'
           for ((dimm) =3D (mci)->dimms[0];                          \
           ^
   drivers/edac/edac_mc.c:1141:6: note: 'any_memory' is true
           if (any_memory)
               ^~~~~~~~~~
   drivers/edac/edac_mc.c:1141:2: note: Taking true branch
           if (any_memory)
           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:33: note: The value 3 is assigned to 'i'
           for (i =3D 0; i < mci->n_layers; i++) {
                                          ^~~
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:14: note: The left operand of '<' is a garba=
ge value due to array index out of bounds
                   if (pos[i] < 0)
                       ~~~~~~ ^
>> drivers/edac/edac_mc.c:1155:8: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   p +=3D sprintf(p, "%s:%d ",
                        ^~~~~~~
   drivers/edac/edac_mc.c:1155:8: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   p +=3D sprintf(p, "%s:%d ",
                        ^~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   drivers/w1/w1_netlink.c:122:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(block->cn, &block->request_cn, sizeof(*block->cn)=
);
                   ^~~~~~
   drivers/w1/w1_netlink.c:122:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(block->cn, &block->request_cn, sizeof(*block->cn)=
);
                   ^~~~~~
   drivers/w1/w1_netlink.c:145:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(block->msg, block->cur_msg, sizeof(*block->msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:145:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(block->msg, block->cur_msg, sizeof(*block->msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:152:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(block->cmd, cmd, space);
                   ^~~~~~
   drivers/w1/w1_netlink.c:152:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(block->cmd, cmd, space);
                   ^~~~~~
   drivers/w1/w1_netlink.c:168:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(block->msg, req_msg, sizeof(*req_msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:168:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(block->msg, req_msg, sizeof(*req_msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:174:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cmd, req_cmd, sizeof(*cmd));
                   ^~~~~~
   drivers/w1/w1_netlink.c:174:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(cmd, req_cmd, sizeof(*cmd));
                   ^~~~~~
   drivers/w1/w1_netlink.c:199:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&packet.cn, cn, sizeof(packet.cn));
           ^~~~~~
   drivers/w1/w1_netlink.c:199:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&packet.cn, cn, sizeof(packet.cn));
           ^~~~~~
   drivers/w1/w1_netlink.c:200:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&packet.msg, msg, sizeof(packet.msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:200:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&packet.msg, msg, sizeof(packet.msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:220:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&packet, 0, sizeof(packet));
           ^~~~~~
   drivers/w1/w1_netlink.c:220:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&packet, 0, sizeof(packet));
           ^~~~~~
   drivers/w1/w1_netlink.c:228:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&packet.msg, msg, sizeof(*msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:228:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&packet.msg, msg, sizeof(*msg));
           ^~~~~~
   drivers/w1/w1_netlink.c:244:18: warning: Access to field 'len' results i=
n a dereference of a null pointer (loaded from variable 'cache_cmd') [clang=
-analyzer-core.NullDereference]
                   cache_cmd->len =3D 0;
                                  ^
   drivers/w1/w1_netlink.c:261:2: note: Calling 'w1_send_slave'
           w1_send_slave(dev, rn);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:237:2: note: 'cache_cmd' initialized here
           struct w1_netlink_cmd *cache_cmd =3D block->cmd;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:240:2: note: Calling 'w1_reply_make_space'
           w1_reply_make_space(block, sizeof(*data));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:84:12: note: Calling 'w1_reply_len'
           u16 len =3D w1_reply_len(block);
                     ^~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:57:6: note: Assuming field 'cn' is null
           if (!block->cn)
               ^~~~~~~~~~
   drivers/w1/w1_netlink.c:57:2: note: Taking true branch
           if (!block->cn)
           ^
   drivers/w1/w1_netlink.c:58:3: note: Returning without writing to 'block-=
>cmd', which participates in a condition later
                   return 0;
                   ^
   drivers/w1/w1_netlink.c:84:12: note: Returning from 'w1_reply_len'
           u16 len =3D w1_reply_len(block);
                     ^~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:85:6: note: Assuming the condition is false
           if (len + space >=3D block->maxlen) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/w1_netlink.c:85:2: note: Taking false branch
           if (len + space >=3D block->maxlen) {
           ^
   drivers/w1/w1_netlink.c:92:1: note: Returning without writing to 'block-=
>cmd', which participates in a condition later
   }
--
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/x25/x25_route.c:49:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rt->address.x25_addr, address->x25_addr, sigdigits);
           ^~~~~~
   net/x25/x25_route.c:49:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(rt->address.x25_addr, address->x25_addr, sigdigits);
           ^~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   net/x25/x25_proc.c:45:20: warning: Value stored to 'rt' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct x25_route *rt =3D list_entry(v, struct x25_route, node);
                             ^~
   net/x25/x25_proc.c:45:20: note: Value stored to 'rt' during its initiali=
zation is never read
           struct x25_route *rt =3D list_entry(v, struct x25_route, node);
                             ^~
   net/x25/x25_proc.c:94:26: warning: Although the value stored to 'dev' is=
 used in the enclosing expression, the value is never actually read from 'd=
ev' [clang-analyzer-deadcode.DeadStores]
           if (!x25->neighbour || (dev =3D x25->neighbour->dev) =3D=3D NULL)
                                   ^     ~~~~~~~~~~~~~~~~~~~
   net/x25/x25_proc.c:94:26: note: Although the value stored to 'dev' is us=
ed in the enclosing expression, the value is never actually read from 'dev'
           if (!x25->neighbour || (dev =3D x25->neighbour->dev) =3D=3D NULL)
                                   ^     ~~~~~~~~~~~~~~~~~~~
   net/x25/x25_proc.c:133:22: warning: Value stored to 'f' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct x25_forward *f =3D list_entry(v, struct x25_forward, node=
);
                               ^
   net/x25/x25_proc.c:133:22: note: Value stored to 'f' during its initiali=
zation is never read
           struct x25_forward *f =3D list_entry(v, struct x25_forward, node=
);
                               ^
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   net/sched/act_pedit.c:230:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p->tcfp_keys, parm->keys, ksize);
           ^~~~~~
   net/sched/act_pedit.c:230:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(p->tcfp_keys, parm->keys, ksize);
           ^~~~~~
   net/sched/act_pedit.c:437:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(opt->keys, p->tcfp_keys, flex_array_size(opt, keys, p->tc=
fp_nkeys));
           ^~~~~~
   net/sched/act_pedit.c:437:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(opt->keys, p->tcfp_keys, flex_array_size(opt, keys, p->tc=
fp_nkeys));
           ^~~~~~
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   Suppressed 94 warnings (94 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/sched/sch_gred.c:800:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&opt, 0, sizeof(opt));
                   ^~~~~~
   net/sched/sch_gred.c:800:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&opt, 0, sizeof(opt));
                   ^~~~~~
   Suppressed 94 warnings (94 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
   Suppressed 100 warnings (100 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   net/ipv4/inet_fragment.c:516:5: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:516:5: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:560:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   net/ipv4/inet_fragment.c:560:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   Suppressed 106 warnings (106 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/accessibility/speakup/speakup_soft.c:157:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:157:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
>> drivers/accessibility/speakup/speakup_soft.c:163:14: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                           cp =3D cp + sprintf(cp, var->u.n.synth_fmt,
                                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:163:14: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                           cp =3D cp + sprintf(cp, var->u.n.synth_fmt,
                                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:2: warning: Value store=
d to 'cp' is never read [clang-analyzer-deadcode.DeadStores]
           cp =3D cp + sprintf(cp, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:2: note: Value stored t=
o 'cp' is never read
           cp =3D cp + sprintf(cp, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:12: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           cp =3D cp + sprintf(cp, "\n");
                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:12: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
           cp =3D cp + sprintf(cp, "\n");
                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:379:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&synth_device, 0, sizeof(synth_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:379:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&synth_device, 0, sizeof(synth_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:388:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&synthu_device, 0, sizeof(synthu_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:388:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&synthu_device, 0, sizeof(synthu_device));
           ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   drivers/block/aoe/aoecmd.c:125:9: warning: Although the value stored to =
'n' is used in the enclosing expression, the value is never actually read f=
rom 'n' [clang-analyzer-deadcode.DeadStores]
           return n |=3D (++d->lasttag & 0x7fff) << 16;
                  ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/aoe/aoecmd.c:125:9: note: Although the value stored to 'n'=
 is used in the enclosing expression, the value is never actually read from=
 'n'
           return n |=3D (++d->lasttag & 0x7fff) << 16;
                  ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/aoe/aoecmd.c:133:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(h->src, t->ifp->nd->dev_addr, sizeof h->src);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:133:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(h->src, t->ifp->nd->dev_addr, sizeof h->src);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:134:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(h->dst, t->addr, sizeof h->dst);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:134:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(h->dst, t->addr, sizeof h->dst);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:153:13: warning: Although the value stored to=
 'lba' is used in the enclosing expression, the value is never actually rea=
d from 'lba' [clang-analyzer-deadcode.DeadStores]
           ah->lba5 =3D lba >>=3D 8;
                      ^       ~
   drivers/block/aoe/aoecmd.c:153:13: note: Although the value stored to 'l=
ba' is used in the enclosing expression, the value is never actually read f=
rom 'lba'
           ah->lba5 =3D lba >>=3D 8;
                      ^       ~
   drivers/block/aoe/aoecmd.c:199:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&f->iter, 0, sizeof(f->iter));
           ^~~~~~
   drivers/block/aoe/aoecmd.c:199:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&f->iter, 0, sizeof(f->iter));
           ^~~~~~
   drivers/block/aoe/aoecmd.c:330:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(h, 0, skb->len);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:330:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(h, 0, skb->len);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:435:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(h, 0, sizeof *h + sizeof *ch);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:435:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(h, 0, sizeof *h + sizeof *ch);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:437:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(h->dst, 0xff, sizeof h->dst);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:437:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(h->dst, 0xff, sizeof h->dst);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:438:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(h->src, ifp->dev_addr, sizeof h->src);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:438:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(h->src, ifp->dev_addr, sizeof h->src);
                   ^~~~~~
   drivers/block/aoe/aoecmd.c:473:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, sizeof(buf),
                   ^~~~~~~~
   drivers/block/aoe/aoecmd.c:473:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, sizeof(buf),
                   ^~~~~~~~
   drivers/block/aoe/aoecmd.c:484:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(h->dst, t->addr, sizeof h->dst);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:484:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(h->dst, t->addr, sizeof h->dst);
           ^~~~~~
   drivers/block/aoe/aoecmd.c:485:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(h->src, t->ifp->nd->dev_addr, sizeof h->src);

vim +1155 drivers/edac/edac_mc.c

53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1014  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1015  void edac_mc_handle=
_error(const enum hw_event_mc_err_type type,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1016  			  struct mem_ctl=
_info *mci,
9eb07a7fb8a90ee Mauro Carvalho Chehab 2012-06-04  1017  			  const u16 erro=
r_count,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1018  			  const unsigned=
 long page_frame_number,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1019  			  const unsigned=
 long offset_in_page,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1020  			  const unsigned=
 long syndrome,
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1021  			  const int top_=
layer,
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1022  			  const int mid_=
layer,
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1023  			  const int low_=
layer,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1024  			  const char *ms=
g,
03f7eae80f4b913 Mauro Carvalho Chehab 2012-06-04  1025  			  const char *ot=
her_detail)
da9bb1d27b21cb2 Alan Cox              2006-01-18  1026  {
c498afaf7df87f4 Robert Richter        2019-11-06  1027  	struct dimm_info *=
dimm;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1028  	char *p;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1029  	int row =3D -1, ch=
an =3D -1;
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1030  	int pos[EDAC_MAX_L=
AYERS] =3D { top_layer, mid_layer, low_layer };
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1031  	int i, n_labels =
=3D 0;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1032  	struct edac_raw_er=
ror_desc *e =3D &mci->error_desc;
67792cf9583c781 Robert Richter        2020-01-23  1033  	bool any_memory =
=3D true;
da9bb1d27b21cb2 Alan Cox              2006-01-18  1034  =

956b9ba156dbfdb Joe Perches           2012-04-29  1035  	edac_dbg(3, "MC%d\=
n", mci->mc_idx);
da9bb1d27b21cb2 Alan Cox              2006-01-18  1036  =

c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1037  	/* Fills the error=
 report buffer */
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1038  	memset(e, 0, sizeo=
f (*e));
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1039  	e->error_count =3D=
 error_count;
672ef0e5684048a Robert Richter        2020-01-23  1040  	e->type =3D type;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1041  	e->top_layer =3D t=
op_layer;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1042  	e->mid_layer =3D m=
id_layer;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1043  	e->low_layer =3D l=
ow_layer;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1044  	e->page_frame_numb=
er =3D page_frame_number;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1045  	e->offset_in_page =
=3D offset_in_page;
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1046  	e->syndrome =3D sy=
ndrome;
1853ee72997645e Robert Richter        2020-01-23  1047  	/* need valid stri=
ngs here for both: */
1853ee72997645e Robert Richter        2020-01-23  1048  	e->msg =3D msg ?: =
"";
1853ee72997645e Robert Richter        2020-01-23  1049  	e->other_detail =
=3D other_detail ?: "";
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1050  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1051  	/*
67792cf9583c781 Robert Richter        2020-01-23  1052  	 * Check if the ev=
ent report is consistent and if the memory location is
4aa92c86463273b Robert Richter        2020-02-17  1053  	 * known. If it is=
, the DIMM(s) label info will be filled and the DIMM's
4aa92c86463273b Robert Richter        2020-02-17  1054  	 * error counters =
will be incremented.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1055  	 */
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1056  	for (i =3D 0; i < =
mci->n_layers; i++) {
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1057  		if (pos[i] >=3D (=
int)mci->layers[i].size) {
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1058  =

537fba28928c01b Dave Peterson         2006-03-26  1059  			edac_mc_printk(m=
ci, KERN_ERR,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1060  				       "INTERNA=
L ERROR: %s value is out of range (%d >=3D %d)\n",
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1061  				       edac_lay=
er_name[mci->layers[i].type],
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1062  				       pos[i], =
mci->layers[i].size);
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1063  			/*
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1064  			 * Instead of ju=
st returning it, let's use what's
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1065  			 * known about t=
he error. The increment routines and
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1066  			 * the DIMM filt=
er logic will do the right thing by
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1067  			 * pointing the =
likely damaged DIMMs.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1068  			 */
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1069  			pos[i] =3D -1;
da9bb1d27b21cb2 Alan Cox              2006-01-18  1070  		}
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1071  		if (pos[i] >=3D 0)
67792cf9583c781 Robert Richter        2020-01-23  1072  			any_memory =3D f=
alse;
da9bb1d27b21cb2 Alan Cox              2006-01-18  1073  	}
da9bb1d27b21cb2 Alan Cox              2006-01-18  1074  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1075  	/*
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1076  	 * Get the dimm la=
bel/grain that applies to the match criteria.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1077  	 * As the error al=
gorithm may not be able to point to just one memory
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1078  	 * stick, the logi=
c here will get all possible labels that could
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1079  	 * pottentially be=
 affected by the error.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1080  	 * On FB-DIMM memo=
ry controllers, for uncorrected errors, it is common
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1081  	 * to have only th=
e MC channel and the MC dimm (also called "branch")
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1082  	 * but the channel=
 is not known, as the memory is arranged in pairs,
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1083  	 * where each memo=
ry belongs to a separate channel within the same
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1084  	 * branch.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1085  	 */
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1086  	p =3D e->label;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1087  	*p =3D '\0';
4da1b7bfe769988 Borislav Petkov       2012-09-10  1088  =

c498afaf7df87f4 Robert Richter        2019-11-06  1089  	mci_for_each_dimm(=
mci, dimm) {
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1090  		if (top_layer >=
=3D 0 && top_layer !=3D dimm->location[0])
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1091  			continue;
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1092  		if (mid_layer >=
=3D 0 && mid_layer !=3D dimm->location[1])
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1093  			continue;
53f2d02898755d1 Mauro Carvalho Chehab 2012-02-23  1094  		if (low_layer >=
=3D 0 && low_layer !=3D dimm->location[2])
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1095  			continue;
da9bb1d27b21cb2 Alan Cox              2006-01-18  1096  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1097  		/* get the max gr=
ain, over the error match range */
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1098  		if (dimm->grain >=
 e->grain)
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1099  			e->grain =3D dim=
m->grain;
da9bb1d27b21cb2 Alan Cox              2006-01-18  1100  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1101  		/*
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1102  		 * If the error i=
s memory-controller wide, there's no need to
67792cf9583c781 Robert Richter        2020-01-23  1103  		 * seek for the a=
ffected DIMMs because the whole channel/memory
67792cf9583c781 Robert Richter        2020-01-23  1104  		 * controller/...=
 may be affected. Also, don't show errors for
67792cf9583c781 Robert Richter        2020-01-23  1105  		 * empty DIMM slo=
ts.
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1106  		 */
65bb4d1af92cf00 Robert Richter        2020-01-23  1107  		if (!dimm->nr_pag=
es)
0d8292e003efffa Robert Richter        2019-11-06  1108  			continue;
0d8292e003efffa Robert Richter        2019-11-06  1109  =

c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1110  		n_labels++;
65bb4d1af92cf00 Robert Richter        2020-01-23  1111  		if (n_labels > ED=
AC_MAX_LABELS) {
65bb4d1af92cf00 Robert Richter        2020-01-23  1112  			p =3D e->label;
65bb4d1af92cf00 Robert Richter        2020-01-23  1113  			*p =3D '\0';
65bb4d1af92cf00 Robert Richter        2020-01-23  1114  		} else {
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1115  			if (p !=3D e->la=
bel) {
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1116  				strcpy(p, OTHER=
_LABEL);
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1117  				p +=3D strlen(O=
THER_LABEL);
da9bb1d27b21cb2 Alan Cox              2006-01-18  1118  			}
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1119  			strcpy(p, dimm->=
label);
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1120  			p +=3D strlen(p);
65bb4d1af92cf00 Robert Richter        2020-01-23  1121  		}
da9bb1d27b21cb2 Alan Cox              2006-01-18  1122  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1123  		/*
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1124  		 * get csrow/chan=
nel of the DIMM, in order to allow
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1125  		 * incrementing t=
he compat API counters
9794f33ddedd878 eric wollesen         2007-02-12  1126  		 */
956b9ba156dbfdb Joe Perches           2012-04-29  1127  		edac_dbg(4, "%s c=
srows map: (%d,%d)\n",
9713faecff3d071 Mauro Carvalho Chehab 2013-03-11  1128  			mci->csbased ? "=
rank" : "dimm",
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1129  			dimm->csrow, dim=
m->cschannel);
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1130  		if (row =3D=3D -1)
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1131  			row =3D dimm->cs=
row;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1132  		else if (row >=3D=
 0 && row !=3D dimm->csrow)
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1133  			row =3D -2;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1134  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1135  		if (chan =3D=3D -=
1)
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1136  			chan =3D dimm->c=
schannel;
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1137  		else if (chan >=
=3D 0 && chan !=3D dimm->cschannel)
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1138  			chan =3D -2;
9794f33ddedd878 eric wollesen         2007-02-12  1139  	}
9794f33ddedd878 eric wollesen         2007-02-12  1140  =

67792cf9583c781 Robert Richter        2020-01-23  1141  	if (any_memory)
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1142  		strcpy(e->label, =
"any memory");
6334dc4e3ff5303 Robert Richter        2020-02-14  1143  	else if (!*e->labe=
l)
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1144  		strcpy(e->label, =
"unknown memory");
6334dc4e3ff5303 Robert Richter        2020-02-14  1145  =

6334dc4e3ff5303 Robert Richter        2020-02-14  1146  	edac_inc_csrow(e, =
row, chan);
9794f33ddedd878 eric wollesen         2007-02-12  1147  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1148  	/* Fill the RAM lo=
cation data */
c7ef7645544131b Mauro Carvalho Chehab 2013-02-21  1149  	p =3D e->location;
4da1b7bfe769988 Borislav Petkov       2012-09-10  1150  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18  1151  	for (i =3D 0; i < =
mci->n_layers; i++) {
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1152  		if (pos[i] < 0)
4275be63559719c Mauro Carvalho Chehab 2012-04-18  1153  			continue;
9794f33ddedd878 eric wollesen         2007-02-12  1154  =

4275be63559719c Mauro Carvalho Chehab 2012-04-18 @1155  		p +=3D sprintf(p,=
 "%s:%d ",

:::::: The code@line 1155 was first introduced by commit
:::::: 4275be63559719c3149b19751029f1b0f1b26775 edac: Change internal repre=
sentation to work with layers

:::::: TO: Mauro Carvalho Chehab <mchehab@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1615688835533311702==--


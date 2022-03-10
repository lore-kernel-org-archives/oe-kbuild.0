Content-Type: multipart/mixed; boundary="===============4492500550286383636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:netdev/net-next/master 72/198] net/bluetooth/smp.c:1313:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Thu, 10 Mar 2022 21:31:09 +0800
Message-ID: <202203102111.H2PhtKfC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4492500550286383636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/master
head:   24055bb87977e0c687b54ebf7bac8715f3636bc3
commit: 9b392e0e0b6d026da5a62bb79a08f32e27af858e [72/198] Bluetooth: Fix no=
t checking for valid hdev on bt_dev_{info,warn,err,dbg}
:::::: branch date: 21 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
310/202203102111.H2PhtKfC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/9b392e0e0b6d026=
da5a62bb79a08f32e27af858e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 9b392e0e0b6d026da5a62bb79a08f32e27af858e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 'f=
lags'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-log-writes.c:611:10: note: Returning from 'kzalloc'
           block =3D kzalloc(sizeof(struct pending_block), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-log-writes.c:612:6: note: Assuming 'block' is non-null
           if (!block) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-log-writes.c:612:2: note: '?' condition is false
           if (!block) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-log-writes.c:612:7: note: 'block' is non-null
           if (!block) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/dm-log-writes.c:612:2: note: '?' condition is false
           if (!block) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/dm-log-writes.c:612:2: note: Taking false branch
           if (!block) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-log-writes.c:618:6: note: Assuming field 'data' is non-null
           if (!block->data) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-log-writes.c:618:2: note: '?' condition is false
           if (!block->data) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-log-writes.c:618:14: note: Field 'data' is non-null
           if (!block->data) {
                       ^
   drivers/md/dm-log-writes.c:618:2: note: '?' condition is false
           if (!block->data) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/dm-log-writes.c:618:2: note: Taking false branch
           if (!block->data) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-log-writes.c:625:15: note: The left expression of the comp=
ound assignment is an uninitialized value. The computed value will also be =
garbage
           block->flags |=3D LOG_MARK_FLAG;
           ~~~~~~~~~~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> net/bluetooth/smp.c:1313:3: warning: Null pointer passed as 2nd argument=
 to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(idinfo.irk, hdev->irk, sizeof(idinfo.irk));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^                   ~
   net/bluetooth/smp.c:1241:2: note: '?' condition is false
           bt_dev_dbg(hdev, "conn %p", conn);
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/bluetooth/smp.c:1241:2: note: '?' condition is false
           bt_dev_dbg(hdev, "conn %p", conn);
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/bluetooth/smp.c:1241:2: note: Taking false branch
           bt_dev_dbg(hdev, "conn %p", conn);
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/bluetooth/smp.c:1241:2: note: Loop condition is false.  Exiting loop
           bt_dev_dbg(hdev, "conn %p", conn);
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   net/bluetooth/smp.c:1246:6: note: Assuming field 'out' is false
           if (hcon->out && (smp->remote_key_dist & KEY_DIST_MASK)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +1313 net/bluetooth/smp.c

b5ae344d4c0f69 Johan Hedberg          2014-08-14  1232  =

d6268e86a12a94 Johan Hedberg          2014-09-05  1233  static void smp_dis=
tribute_keys(struct smp_chan *smp)
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1234  {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1235  	struct smp_cmd_pai=
ring *req, *rsp;
86d1407cb9cd3c Johan Hedberg          2014-08-11  1236  	struct l2cap_conn =
*conn =3D smp->conn;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1237  	struct hci_conn *h=
con =3D conn->hcon;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1238  	struct hci_dev *hd=
ev =3D hcon->hdev;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1239  	__u8 *keydist;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1240  =

2e1614f7d61e40 Luiz Augusto von Dentz 2021-03-15  1241  	bt_dev_dbg(hdev, "=
conn %p", conn);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1242  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1243  	rsp =3D (void *) &=
smp->prsp[1];
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1244  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1245  	/* The responder s=
ends its keys first */
b28b4943660f4e Johan Hedberg          2014-09-05  1246  	if (hcon->out && (=
smp->remote_key_dist & KEY_DIST_MASK)) {
b28b4943660f4e Johan Hedberg          2014-09-05  1247  		smp_allow_key_dis=
t(smp);
86d1407cb9cd3c Johan Hedberg          2014-08-11  1248  		return;
b28b4943660f4e Johan Hedberg          2014-09-05  1249  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1250  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1251  	req =3D (void *) &=
smp->preq[1];
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1252  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1253  	if (hcon->out) {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1254  		keydist =3D &rsp-=
>init_key_dist;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1255  		*keydist &=3D req=
->init_key_dist;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1256  	} else {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1257  		keydist =3D &rsp-=
>resp_key_dist;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1258  		*keydist &=3D req=
->resp_key_dist;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1259  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1260  =

6a77083af57f2d Johan Hedberg          2014-06-06  1261  	if (test_bit(SMP_F=
LAG_SC, &smp->flags)) {
b5ae344d4c0f69 Johan Hedberg          2014-08-14  1262  		if (hcon->type =
=3D=3D LE_LINK && (*keydist & SMP_DIST_LINK_KEY))
6a77083af57f2d Johan Hedberg          2014-06-06  1263  			sc_generate_link=
_key(smp);
b5ae344d4c0f69 Johan Hedberg          2014-08-14  1264  		if (hcon->type =
=3D=3D ACL_LINK && (*keydist & SMP_DIST_ENC_KEY))
b5ae344d4c0f69 Johan Hedberg          2014-08-14  1265  			sc_generate_ltk(=
smp);
6a77083af57f2d Johan Hedberg          2014-06-06  1266  =

6a77083af57f2d Johan Hedberg          2014-06-06  1267  		/* Clear the keys=
 which are generated but not distributed */
6a77083af57f2d Johan Hedberg          2014-06-06  1268  		*keydist &=3D ~SM=
P_SC_NO_DIST;
6a77083af57f2d Johan Hedberg          2014-06-06  1269  	}
6a77083af57f2d Johan Hedberg          2014-06-06  1270  =

2e1614f7d61e40 Luiz Augusto von Dentz 2021-03-15  1271  	bt_dev_dbg(hdev, "=
keydist 0x%x", *keydist);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1272  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1273  	if (*keydist & SMP=
_DIST_ENC_KEY) {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1274  		struct smp_cmd_en=
crypt_info enc;
fad646e16d3caf Archie Pusaka          2021-05-31  1275  		struct smp_cmd_in=
itiator_ident ident;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1276  		struct smp_ltk *l=
tk;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1277  		u8 authenticated;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1278  		__le16 ediv;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1279  		__le64 rand;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1280  =

1fc62c526a5717 Johan Hedberg          2015-06-10  1281  		/* Make sure we g=
enerate only the significant amount of
1fc62c526a5717 Johan Hedberg          2015-06-10  1282  		 * bytes based on=
 the encryption key size, and set the rest
1fc62c526a5717 Johan Hedberg          2015-06-10  1283  		 * of the value t=
o zeroes.
1fc62c526a5717 Johan Hedberg          2015-06-10  1284  		 */
1fc62c526a5717 Johan Hedberg          2015-06-10  1285  		get_random_bytes(=
enc.ltk, smp->enc_key_size);
1fc62c526a5717 Johan Hedberg          2015-06-10  1286  		memset(enc.ltk + =
smp->enc_key_size, 0,
1fc62c526a5717 Johan Hedberg          2015-06-10  1287  		       sizeof(enc=
.ltk) - smp->enc_key_size);
1fc62c526a5717 Johan Hedberg          2015-06-10  1288  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1289  		get_random_bytes(=
&ediv, sizeof(ediv));
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1290  		get_random_bytes(=
&rand, sizeof(rand));
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1291  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1292  		smp_send_cmd(conn=
, SMP_CMD_ENCRYPT_INFO, sizeof(enc), &enc);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1293  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1294  		authenticated =3D=
 hcon->sec_level =3D=3D BT_SECURITY_HIGH;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1295  		ltk =3D hci_add_l=
tk(hdev, &hcon->dst, hcon->dst_type,
fad646e16d3caf Archie Pusaka          2021-05-31  1296  				  SMP_LTK_RESPO=
NDER, authenticated, enc.ltk,
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1297  				  smp->enc_key_=
size, ediv, rand);
fad646e16d3caf Archie Pusaka          2021-05-31  1298  		smp->responder_lt=
k =3D ltk;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1299  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1300  		ident.ediv =3D ed=
iv;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1301  		ident.rand =3D ra=
nd;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1302  =

fad646e16d3caf Archie Pusaka          2021-05-31  1303  		smp_send_cmd(conn=
, SMP_CMD_INITIATOR_IDENT, sizeof(ident),
fad646e16d3caf Archie Pusaka          2021-05-31  1304  			     &ident);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1305  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1306  		*keydist &=3D ~SM=
P_DIST_ENC_KEY;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1307  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1308  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1309  	if (*keydist & SMP=
_DIST_ID_KEY) {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1310  		struct smp_cmd_id=
ent_addr_info addrinfo;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1311  		struct smp_cmd_id=
ent_info idinfo;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1312  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11 @1313  		memcpy(idinfo.irk=
, hdev->irk, sizeof(idinfo.irk));
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1314  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1315  		smp_send_cmd(conn=
, SMP_CMD_IDENT_INFO, sizeof(idinfo), &idinfo);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1316  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1317  		/* The hci_conn c=
ontains the local identity address
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1318  		 * after the conn=
ection has been established.
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1319  		 *
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1320  		 * This is true e=
ven when the connection has been
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1321  		 * established us=
ing a resolvable random address.
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1322  		 */
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1323  		bacpy(&addrinfo.b=
daddr, &hcon->src);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1324  		addrinfo.addr_typ=
e =3D hcon->src_type;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1325  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1326  		smp_send_cmd(conn=
, SMP_CMD_IDENT_ADDR_INFO, sizeof(addrinfo),
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1327  			     &addrinfo);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1328  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1329  		*keydist &=3D ~SM=
P_DIST_ID_KEY;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1330  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1331  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1332  	if (*keydist & SMP=
_DIST_SIGN) {
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1333  		struct smp_cmd_si=
gn_info sign;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1334  		struct smp_csrk *=
csrk;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1335  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1336  		/* Generate a new=
 random key */
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1337  		get_random_bytes(=
sign.csrk, sizeof(sign.csrk));
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1338  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1339  		csrk =3D kzalloc(=
sizeof(*csrk), GFP_KERNEL);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1340  		if (csrk) {
4cd3928a8bee83 Johan Hedberg          2015-02-27  1341  			if (hcon->sec_le=
vel > BT_SECURITY_MEDIUM)
4cd3928a8bee83 Johan Hedberg          2015-02-27  1342  				csrk->type =3D =
MGMT_CSRK_LOCAL_AUTHENTICATED;
4cd3928a8bee83 Johan Hedberg          2015-02-27  1343  			else
4cd3928a8bee83 Johan Hedberg          2015-02-27  1344  				csrk->type =3D =
MGMT_CSRK_LOCAL_UNAUTHENTICATED;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1345  			memcpy(csrk->val=
, sign.csrk, sizeof(csrk->val));
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1346  		}
fad646e16d3caf Archie Pusaka          2021-05-31  1347  		smp->responder_cs=
rk =3D csrk;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1348  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1349  		smp_send_cmd(conn=
, SMP_CMD_SIGN_INFO, sizeof(sign), &sign);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1350  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1351  		*keydist &=3D ~SM=
P_DIST_SIGN;
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1352  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1353  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1354  	/* If there are st=
ill keys to be received wait for them */
b28b4943660f4e Johan Hedberg          2014-09-05  1355  	if (smp->remote_ke=
y_dist & KEY_DIST_MASK) {
b28b4943660f4e Johan Hedberg          2014-09-05  1356  		smp_allow_key_dis=
t(smp);
86d1407cb9cd3c Johan Hedberg          2014-08-11  1357  		return;
b28b4943660f4e Johan Hedberg          2014-09-05  1358  	}
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1359  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1360  	set_bit(SMP_FLAG_C=
OMPLETE, &smp->flags);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1361  	smp_notify_keys(co=
nn);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1362  =

44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1363  	smp_chan_destroy(c=
onn);
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1364  }
44f1a7ab51ebe1 Johan Hedberg          2014-08-11  1365  =


:::::: The code at line 1313 was first introduced by commit
:::::: 44f1a7ab51ebe1ca189445837e0599a5edc6efb1 Bluetooth: Use L2CAP resume=
 callback to call smp_distribute_keys

:::::: TO: Johan Hedberg <johan.hedberg@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4492500550286383636==--


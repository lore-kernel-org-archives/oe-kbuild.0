Content-Type: multipart/mixed; boundary="===============0255739128932115070=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/target/iscsi/iscsi_target.c:1871:22: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 15 Dec 2021 21:40:55 +0800
Message-ID: <202112152106.bnw1gDnQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0255739128932115070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211215/202112152106.bnw1gDnQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3884:19: note: '?' condition is true
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                                   ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/target/iscsi/iscsi_target.c:3884:7: note: Assuming the condition=
 is false
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3884:3: note: Taking false branch
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                   ^
   drivers/target/iscsi/iscsi_target.c:3889:37: note: Passing null pointer =
value via 2nd parameter 'cmd'
                   ret =3D iscsit_handle_nop_out(conn, cmd, buf);
                                                     ^~~
   drivers/target/iscsi/iscsi_target.c:3889:9: note: Calling 'iscsit_handle=
_nop_out'
                   ret =3D iscsit_handle_nop_out(conn, cmd, buf);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1854:35: note: Passing null pointer =
value via 2nd parameter 'cmd'
           ret =3D iscsit_setup_nop_out(conn, cmd, hdr);
                                            ^~~
   drivers/target/iscsi/iscsi_target.c:1854:8: note: Calling 'iscsit_setup_=
nop_out'
           ret =3D iscsit_setup_nop_out(conn, cmd, hdr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1721:6: note: Assuming the condition=
 is false
           if (!(hdr->flags & ISCSI_FLAG_CMD_FINAL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1721:2: note: Taking false branch
           if (!(hdr->flags & ISCSI_FLAG_CMD_FINAL)) {
           ^
   drivers/target/iscsi/iscsi_target.c:1731:6: note: Assuming field 'itt' i=
s not equal to RESERVED_ITT
           if (hdr->itt =3D=3D RESERVED_ITT && !(hdr->opcode & ISCSI_OP_IMM=
EDIATE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1731:31: note: Left side of '&&' is =
false
           if (hdr->itt =3D=3D RESERVED_ITT && !(hdr->opcode & ISCSI_OP_IMM=
EDIATE)) {
                                        ^
   drivers/target/iscsi/iscsi_target.c:1742:6: note: Assuming 'payload_leng=
th' is <=3D field 'MaxXmitDataSegmentLength'
           if (payload_length > conn->conn_ops->MaxXmitDataSegmentLength) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1742:2: note: Taking false branch
           if (payload_length > conn->conn_ops->MaxXmitDataSegmentLength) {
           ^
   drivers/target/iscsi/iscsi_target.c:1755:2: note: Taking false branch
           pr_debug("Got NOPOUT Ping %s ITT: 0x%08x, TTT: 0x%08x,"
           ^
   include/linux/printk.h:558:2: note: expanded from macro 'pr_debug'
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
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/target/iscsi/iscsi_target.c:1755:2: note: Loop condition is fals=
e.  Exiting loop
           pr_debug("Got NOPOUT Ping %s ITT: 0x%08x, TTT: 0x%08x,"
           ^
   include/linux/printk.h:558:2: note: expanded from macro 'pr_debug'
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
   drivers/target/iscsi/iscsi_target.c:1767:18: note: '?' condition is true
           if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                           ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/target/iscsi/iscsi_target.c:1767:6: note: Assuming the condition=
 is true
           if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1767:2: note: Taking true branch
           if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
           ^
   drivers/target/iscsi/iscsi_target.c:1768:21: note: Access to field 'iscs=
i_opcode' results in a dereference of a null pointer (loaded from variable =
'cmd')
                   cmd->iscsi_opcode       =3D ISCSI_OP_NOOP_OUT;
                   ~~~                     ^
>> drivers/target/iscsi/iscsi_target.c:1871:22: warning: Dereference of nul=
l pointer [clang-analyzer-core.NullDereference]
                   iov[niov].iov_base      =3D ping_data;
                                           ^
   drivers/target/iscsi/iscsi_target.c:3961:6: note: Assuming 'buffer' is n=
on-null
           if (!buffer)
               ^~~~~~~
   drivers/target/iscsi/iscsi_target.c:3961:2: note: Taking false branch
           if (!buffer)
           ^
   drivers/target/iscsi/iscsi_target.c:3964:9: note: Assuming the condition=
 is true
           while (!kthread_should_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3964:2: note: Loop condition is true=
.  Entering loop body
           while (!kthread_should_stop()) {
           ^
   drivers/target/iscsi/iscsi_target.c:3977:7: note: Assuming 'ret' is equa=
l to ISCSI_HDR_LEN
                   if (ret !=3D ISCSI_HDR_LEN) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3977:3: note: Taking false branch
                   if (ret !=3D ISCSI_HDR_LEN) {
                   ^
   drivers/target/iscsi/iscsi_target.c:3982:7: note: Assuming field 'Header=
Digest' is 0
                   if (conn->conn_ops->HeaderDigest) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3982:3: note: Taking false branch
                   if (conn->conn_ops->HeaderDigest) {
                   ^
   drivers/target/iscsi/iscsi_target.c:4012:7: note: Assuming field 'conn_s=
tate' is not equal to TARG_CONN_STATE_IN_LOGOUT
                   if (conn->conn_state =3D=3D TARG_CONN_STATE_IN_LOGOUT)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:4012:3: note: Taking false branch
                   if (conn->conn_state =3D=3D TARG_CONN_STATE_IN_LOGOUT)
                   ^
   drivers/target/iscsi/iscsi_target.c:4017:7: note: Assuming field 'Sessio=
nType' is not equal to 0
                   if (conn->sess->sess_ops->SessionType &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:4017:7: note: Left side of '&&' is t=
rue
   drivers/target/iscsi/iscsi_target.c:4018:8: note: Assuming the condition=
 is false
                      ((!(opcode & ISCSI_OP_TEXT)) ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:4018:7: note: Left side of '||' is f=
alse
                      ((!(opcode & ISCSI_OP_TEXT)) ||
                       ^
   drivers/target/iscsi/iscsi_target.c:4019:8: note: Assuming the condition=
 is false
                       (!(opcode & ISCSI_OP_LOGOUT)))) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:4017:3: note: Taking false branch
                   if (conn->sess->sess_ops->SessionType &&
                   ^
   drivers/target/iscsi/iscsi_target.c:4027:9: note: Calling 'iscsi_target_=
rx_opcode'
                   ret =3D iscsi_target_rx_opcode(conn, buffer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3871:2: note: Control jumps to 'case=
 0:'  at line 3882
           switch (hdr->opcode & ISCSI_OPCODE_MASK) {
           ^
   drivers/target/iscsi/iscsi_target.c:3883:3: note: Null pointer value sto=
red to 'cmd'
                   cmd =3D NULL;
                   ^~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3884:19: note: '?' condition is true
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                                   ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/target/iscsi/iscsi_target.c:3884:7: note: Assuming the condition=
 is false
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:3884:3: note: Taking false branch
                   if (hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
                   ^
   drivers/target/iscsi/iscsi_target.c:3889:37: note: Passing null pointer =
value via 2nd parameter 'cmd'
                   ret =3D iscsit_handle_nop_out(conn, cmd, buf);
                                                     ^~~
   drivers/target/iscsi/iscsi_target.c:3889:9: note: Calling 'iscsit_handle=
_nop_out'
                   ret =3D iscsit_handle_nop_out(conn, cmd, buf);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1854:8: note: Calling 'iscsit_setup_=
nop_out'
           ret =3D iscsit_setup_nop_out(conn, cmd, hdr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1721:6: note: Assuming the condition=
 is false
           if (!(hdr->flags & ISCSI_FLAG_CMD_FINAL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1721:2: note: Taking false branch
           if (!(hdr->flags & ISCSI_FLAG_CMD_FINAL)) {
           ^
   drivers/target/iscsi/iscsi_target.c:1731:6: note: Assuming field 'itt' i=
s not equal to RESERVED_ITT
           if (hdr->itt =3D=3D RESERVED_ITT && !(hdr->opcode & ISCSI_OP_IMM=
EDIATE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1731:31: note: Left side of '&&' is =
false
           if (hdr->itt =3D=3D RESERVED_ITT && !(hdr->opcode & ISCSI_OP_IMM=
EDIATE)) {
                                        ^
   drivers/target/iscsi/iscsi_target.c:1742:6: note: Assuming 'payload_leng=
th' is > field 'MaxXmitDataSegmentLength', which participates in a conditio=
n later
           if (payload_length > conn->conn_ops->MaxXmitDataSegmentLength) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:1742:2: note: Taking true branch

vim +1871 drivers/target/iscsi/iscsi_target.c

778de368964c5b7 Nicholas Bellinger 2013-06-14  1844  =

778de368964c5b7 Nicholas Bellinger 2013-06-14  1845  static int iscsit_hand=
le_nop_out(struct iscsi_conn *conn, struct iscsi_cmd *cmd,
778de368964c5b7 Nicholas Bellinger 2013-06-14  1846  				 unsigned char *bu=
f)
778de368964c5b7 Nicholas Bellinger 2013-06-14  1847  {
778de368964c5b7 Nicholas Bellinger 2013-06-14  1848  	unsigned char *ping_d=
ata =3D NULL;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1849  	struct iscsi_nopout *=
hdr =3D (struct iscsi_nopout *)buf;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1850  	struct kvec *iov =3D =
NULL;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1851  	u32 payload_length =
=3D ntoh24(hdr->dlength);
778de368964c5b7 Nicholas Bellinger 2013-06-14  1852  	int ret;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1853  =

778de368964c5b7 Nicholas Bellinger 2013-06-14  1854  	ret =3D iscsit_setup_=
nop_out(conn, cmd, hdr);
778de368964c5b7 Nicholas Bellinger 2013-06-14  1855  	if (ret < 0)
561bf1589237559 Nicholas Bellinger 2013-07-03  1856  		return 0;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1857  	/*
778de368964c5b7 Nicholas Bellinger 2013-06-14  1858  	 * Handle NOP-OUT pay=
load for traditional iSCSI sockets
778de368964c5b7 Nicholas Bellinger 2013-06-14  1859  	 */
50e5c87de4c2446 Christoph Hellwig  2012-09-26  1860  	if (payload_length &&=
 hdr->ttt =3D=3D cpu_to_be32(0xFFFFFFFF)) {
778de368964c5b7 Nicholas Bellinger 2013-06-14  1861  		u32 checksum, data_c=
rc, padding =3D 0;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1862  		int niov =3D 0, rx_g=
ot, rx_size =3D payload_length;
778de368964c5b7 Nicholas Bellinger 2013-06-14  1863  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1864  		ping_data =3D kzallo=
c(payload_length + 1, GFP_KERNEL);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1865  		if (!ping_data) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1866  			ret =3D -1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1867  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1868  		}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1869  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1870  		iov =3D &cmd->iov_mi=
sc[0];
e48354ce078c079 Nicholas Bellinger 2011-07-23 @1871  		iov[niov].iov_base	=
=3D ping_data;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1872  		iov[niov++].iov_len	=
=3D payload_length;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1873  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1874  		padding =3D ((-paylo=
ad_length) & 3);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1875  		if (padding !=3D 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1876  			pr_debug("Receiving=
 %u additional bytes"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1877  				" for padding.\n",=
 padding);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1878  			iov[niov].iov_base	=
=3D &cmd->pad_bytes;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1879  			iov[niov++].iov_len=
	=3D padding;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1880  			rx_size +=3D paddin=
g;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1881  		}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1882  		if (conn->conn_ops->=
DataDigest) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1883  			iov[niov].iov_base	=
=3D &checksum;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1884  			iov[niov++].iov_len=
	=3D ISCSI_CRC_LEN;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1885  			rx_size +=3D ISCSI_=
CRC_LEN;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1886  		}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1887  =

2e39f1c9064d54e Bart Van Assche    2019-04-02  1888  		WARN_ON_ONCE(niov > =
ARRAY_SIZE(cmd->iov_misc));
e48354ce078c079 Nicholas Bellinger 2011-07-23  1889  		rx_got =3D rx_data(c=
onn, &cmd->iov_misc[0], niov, rx_size);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1890  		if (rx_got !=3D rx_s=
ize) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1891  			ret =3D -1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1892  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1893  		}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1894  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1895  		if (conn->conn_ops->=
DataDigest) {
e1dfb21f004f403 Bart Van Assche    2017-10-31  1896  			iscsit_do_crypto_ha=
sh_buf(conn->conn_rx_hash, ping_data,
e1dfb21f004f403 Bart Van Assche    2017-10-31  1897  						  payload_length=
, padding,
e1dfb21f004f403 Bart Van Assche    2017-10-31  1898  						  cmd->pad_bytes=
, &data_crc);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1899  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1900  			if (checksum !=3D d=
ata_crc) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1901  				pr_err("Ping data =
CRC32C DataDigest"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1902  				" 0x%08x does not =
match computed 0x%08x\n",
e48354ce078c079 Nicholas Bellinger 2011-07-23  1903  					checksum, data_cr=
c);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1904  				if (!conn->sess->s=
ess_ops->ErrorRecoveryLevel) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1905  					pr_err("Unable to=
 recover from"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1906  					" NOPOUT Ping Dat=
aCRC failure while in"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1907  						" ERL=3D0.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  1908  					ret =3D -1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1909  					goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1910  				} else {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1911  					/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  1912  					 * Silently drop =
this PDU and let the
e48354ce078c079 Nicholas Bellinger 2011-07-23  1913  					 * initiator plug=
 the CmdSN gap.
e48354ce078c079 Nicholas Bellinger 2011-07-23  1914  					 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  1915  					pr_debug("Droppin=
g NOPOUT"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1916  					" Command CmdSN: =
0x%08x due to"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1917  					" DataCRC error.\=
n", hdr->cmdsn);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1918  					ret =3D 0;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1919  					goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1920  				}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1921  			} else {
e48354ce078c079 Nicholas Bellinger 2011-07-23  1922  				pr_debug("Got CRC3=
2C DataDigest"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1923  				" 0x%08x for %u by=
tes of ping data.\n",
e48354ce078c079 Nicholas Bellinger 2011-07-23  1924  					checksum, payload=
_length);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1925  			}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1926  		}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1927  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1928  		ping_data[payload_le=
ngth] =3D '\0';
e48354ce078c079 Nicholas Bellinger 2011-07-23  1929  		/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  1930  		 * Attach ping data =
to struct iscsi_cmd->buf_ptr.
e48354ce078c079 Nicholas Bellinger 2011-07-23  1931  		 */
8359cf43b9dccdd J=C3=B6rn Engel         2011-11-24  1932  		cmd->buf_ptr =
=3D ping_data;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1933  		cmd->buf_ptr_size =
=3D payload_length;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1934  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1935  		pr_debug("Got %u byt=
es of NOPOUT ping"
e48354ce078c079 Nicholas Bellinger 2011-07-23  1936  			" data.\n", payload=
_length);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1937  		pr_debug("Ping Data:=
 \"%s\"\n", ping_data);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1938  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  1939  =

778de368964c5b7 Nicholas Bellinger 2013-06-14  1940  	return iscsit_process=
_nop_out(conn, cmd, hdr);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1941  out:
e48354ce078c079 Nicholas Bellinger 2011-07-23  1942  	if (cmd)
aafc9d158b0039e Nicholas Bellinger 2013-05-31  1943  		iscsit_free_cmd(cmd,=
 false);
778de368964c5b7 Nicholas Bellinger 2013-06-14  1944  =

e48354ce078c079 Nicholas Bellinger 2011-07-23  1945  	kfree(ping_data);
e48354ce078c079 Nicholas Bellinger 2011-07-23  1946  	return ret;
e48354ce078c079 Nicholas Bellinger 2011-07-23  1947  }
e48354ce078c079 Nicholas Bellinger 2011-07-23  1948  =


:::::: The code at line 1871 was first introduced by commit
:::::: e48354ce078c079996f89d715dfa44814b4eba01 iscsi-target: Add iSCSI fab=
ric support for target v4.1

:::::: TO: Nicholas Bellinger <nab@linux-iscsi.org>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0255739128932115070==--


Content-Type: multipart/mixed; boundary="===============4961464867372274901=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cifs:for-next 9/12] fs/cifs/smb2ops.c:2677:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Mar 2022 03:33:13 +0800
Message-ID: <202203240346.xr6vS8U9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4961464867372274901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-cifs(a)vger.kernel.org
CC: samba-technical(a)lists.samba.org
TO: Ronnie Sahlberg <lsahlber@redhat.com>
CC: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   cf084b6b81ac0571021fa250d942c441d7f25265
commit: c7550868b2ed88725034be3ba78e38721b5747b9 [9/12] cifs: change smb2_q=
uery_info_compound to use a cached fid, if available
:::::: branch date: 15 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20324/202203240346.xr6vS8U9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
        git fetch --no-tags cifs for-next
        git checkout c7550868b2ed88725034be3ba78e38721b5747b9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/net/arcnet/arcdevice.h:79:42: note: expanded from macro 'arc_pri=
ntk'
   #define arc_printk(x, dev, fmt, ...)                                    \
                                                                           ^
   drivers/net/arcnet/com20020.c:313:2: note: Taking false branch
           arc_printk(D_DEBUG, dev, "%s: %d: %s\n", __FILE__, __LINE__, __f=
unc__);
           ^
   drivers/net/arcnet/arcdevice.h:81:2: note: expanded from macro 'arc_prin=
tk'
           if (BUGLVL(x)) {                                                \
           ^
   drivers/net/arcnet/com20020.c:313:2: note: Loop condition is false.  Exi=
ting loop
           arc_printk(D_DEBUG, dev, "%s: %d: %s\n", __FILE__, __LINE__, __f=
unc__);
           ^
   drivers/net/arcnet/arcdevice.h:79:42: note: expanded from macro 'arc_pri=
ntk'
   #define arc_printk(x, dev, fmt, ...)                                    \
                                                                           ^
   drivers/net/arcnet/com20020.c:315:2: note: Calling 'com20020_copy_from_c=
ard'
           com20020_copy_from_card(dev, 0, 0, &inbyte, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/com20020.c:73:2: note: Taking false branch
           TIME(dev, "insb", count,
           ^
   drivers/net/arcnet/arcdevice.h:100:2: note: expanded from macro 'TIME'
           if (BUGLVL(D_TIMING)) {                                         \
           ^
   drivers/net/arcnet/com20020.c:74:7: note: Calling 'insb'
                arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^
   drivers/net/arcnet/arcdevice.h:389:2: note: expanded from macro 'arcnet_=
insb'
           insb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^
   arch/x86/include/asm/io.h:330:14: note: expanded from macro 'insb'
   #define insb insb
                ^
   drivers/net/arcnet/arcdevice.h:110:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   arch/x86/include/asm/io.h:320:1: note: Taking false branch
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:306:2: note: expanded from macro 'BUILDIO'
           if (cc_platform_has(CC_ATTR_GUEST_UNROLL_STRING_IO)) {          \
           ^
   arch/x86/include/asm/io.h:320:1: note: Returning without writing to '*ad=
dr'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:317:11: note: expanded from macro 'BUILDIO'
           }                                                               \
                                                                           ^
   drivers/net/arcnet/com20020.c:74:7: note: Returning from 'insb'
                arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^
   drivers/net/arcnet/arcdevice.h:389:2: note: expanded from macro 'arcnet_=
insb'
           insb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^
   arch/x86/include/asm/io.h:330:14: note: expanded from macro 'insb'
   #define insb insb
                ^
   drivers/net/arcnet/arcdevice.h:110:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   drivers/net/arcnet/com20020.c:73:2: note: Loop condition is false.  Exit=
ing loop
           TIME(dev, "insb", count,
           ^
   drivers/net/arcnet/arcdevice.h:98:42: note: expanded from macro 'TIME'
   #define TIME(dev, name, bytes, call)                                    \
                                                                           ^
   drivers/net/arcnet/com20020.c:75:1: note: Returning without writing to '=
*buf'
   }
   ^
   drivers/net/arcnet/com20020.c:315:2: note: Returning from 'com20020_copy=
_from_card'
           com20020_copy_from_card(dev, 0, 0, &inbyte, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/com20020.c:316:2: note: Taking false branch
           arc_printk(D_DEBUG, dev, "%s: %d: %s\n", __FILE__, __LINE__, __f=
unc__);
           ^
   drivers/net/arcnet/arcdevice.h:81:2: note: expanded from macro 'arc_prin=
tk'
           if (BUGLVL(x)) {                                                \
           ^
   drivers/net/arcnet/com20020.c:316:2: note: Loop condition is false.  Exi=
ting loop
           arc_printk(D_DEBUG, dev, "%s: %d: %s\n", __FILE__, __LINE__, __f=
unc__);
           ^
   drivers/net/arcnet/arcdevice.h:79:42: note: expanded from macro 'arc_pri=
ntk'
   #define arc_printk(x, dev, fmt, ...)                                    \
                                                                           ^
   drivers/net/arcnet/com20020.c:317:13: note: The left operand of '!=3D' i=
s a garbage value
           if (inbyte !=3D TESTvalue) {
               ~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> fs/cifs/smb2ops.c:2677:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D open_cached_dir(xid, tcon, path, cifs_sb, &cfid);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:2677:2: note: Value stored to 'rc' is never read
           rc =3D open_cached_dir(xid, tcon, path, cifs_sb, &cfid);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4252:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4252:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4256:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4256:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4260:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "W");
                   ^~~~~~
   fs/cifs/smb2ops.c:4260:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "W");
                   ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/mpi/mpih-div.c:202:12: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                   return 1 / dsize;
                          ~~^~~~~~~
   lib/mpi/mpih-div.c:194:2: note: Control jumps to 'case 0:'  at line 195
           switch (dsize) {
           ^
   lib/mpi/mpih-div.c:202:12: note: Division by zero
                   return 1 / dsize;
                          ~~^~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/core/skbuff.c:741:6: warning: Access to field 'head' results in a de=
reference of a null pointer (loaded from variable 'skb') [clang-analyzer-co=
re.NullDereference]
           if (likely(skb->head))
               ^
   include/linux/compiler.h:77:39: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)

vim +/rc +2677 fs/cifs/smb2ops.c

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2636  =

07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2637  /*
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2638   * Passes the query info r=
esponse back to the caller on success.
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2639   * Caller need to free thi=
s with free_rsp_buf().
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2640   */
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2641  int
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2642  smb2_query_info_compound(c=
onst unsigned int xid, struct cifs_tcon *tcon,
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2643  			 const char *path, u32 =
desired_access,
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2644  			 u32 class, u32 type, u=
32 output_len,
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2645  			 struct kvec *rsp, int =
*buftype,
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2646  			 struct cifs_sb_info *c=
ifs_sb)
6fc05c25ca35e6 Pavel Shilovsky 2012-09-18  2647  {
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2648  	struct cifs_ses *ses =3D =
tcon->ses;
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2649  	struct TCP_Server_Info *s=
erver =3D cifs_pick_channel(ses);
04ad69c342fc4d Paulo Alcantara 2021-03-08  2650  	int flags =3D CIFS_CP_CRE=
ATE_CLOSE_OP;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2651  	struct smb_rqst rqst[3];
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2652  	int resp_buftype[3];
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2653  	struct kvec rsp_iov[3];
4d8dfafc5cb88f Ronnie Sahlberg 2018-08-21  2654  	struct kvec open_iov[SMB2=
_CREATE_IOV_SIZE];
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2655  	struct kvec qi_iov[1];
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2656  	struct kvec close_iov[1];
6fc05c25ca35e6 Pavel Shilovsky 2012-09-18  2657  	u8 oplock =3D SMB2_OPLOCK=
_LEVEL_NONE;
064f6047a123d6 Pavel Shilovsky 2013-07-09  2658  	struct cifs_open_parms op=
arms;
064f6047a123d6 Pavel Shilovsky 2013-07-09  2659  	struct cifs_fid fid;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2660  	int rc;
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2661  	__le16 *utf16_path;
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2662  	struct cached_fid *cfid =
=3D NULL;
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2663  =

8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2664  	if (!path)
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2665  		path =3D "";
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2666  	utf16_path =3D cifs_conve=
rt_path_to_utf16(path, cifs_sb);
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2667  	if (!utf16_path)
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2668  		return -ENOMEM;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2669  =

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2670  	if (smb3_encryption_requi=
red(tcon))
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2671  		flags |=3D CIFS_TRANSFOR=
M_REQ;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2672  =

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2673  	memset(rqst, 0, sizeof(rq=
st));
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  2674  	resp_buftype[0] =3D resp_=
buftype[1] =3D resp_buftype[2] =3D CIFS_NO_BUFFER;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2675  	memset(rsp_iov, 0, sizeof=
(rsp_iov));
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2676  =

c7550868b2ed88 Ronnie Sahlberg 2022-03-22 @2677  	rc =3D open_cached_dir(xi=
d, tcon, path, cifs_sb, &cfid);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2678  =

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2679  	memset(&open_iov, 0, size=
of(open_iov));
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2680  	rqst[0].rq_iov =3D open_i=
ov;
4d8dfafc5cb88f Ronnie Sahlberg 2018-08-21  2681  	rqst[0].rq_nvec =3D SMB2_=
CREATE_IOV_SIZE;
064f6047a123d6 Pavel Shilovsky 2013-07-09  2682  =

064f6047a123d6 Pavel Shilovsky 2013-07-09  2683  	oparms.tcon =3D tcon;
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2684  	oparms.desired_access =3D=
 desired_access;
064f6047a123d6 Pavel Shilovsky 2013-07-09  2685  	oparms.disposition =3D FI=
LE_OPEN;
0f060936e490c6 Amir Goldstein  2020-02-03  2686  	oparms.create_options =3D=
 cifs_create_options(cifs_sb, 0);
064f6047a123d6 Pavel Shilovsky 2013-07-09  2687  	oparms.fid =3D &fid;
9cbc0b7339b054 Pavel Shilovsky 2013-07-09  2688  	oparms.reconnect =3D fals=
e;
6fc05c25ca35e6 Pavel Shilovsky 2012-09-18  2689  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31  2690  	rc =3D SMB2_open_init(tco=
n, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2691  			    &rqst[0], &oplock, =
&oparms, utf16_path);
6fc05c25ca35e6 Pavel Shilovsky 2012-09-18  2692  	if (rc)
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2693  		goto qic_exit;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  2694  	smb2_set_next_command(tco=
n, &rqst[0]);
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2695  =

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2696  	memset(&qi_iov, 0, sizeof=
(qi_iov));
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2697  	rqst[1].rq_iov =3D qi_iov;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2698  	rqst[1].rq_nvec =3D 1;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2699  =

c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2700  	if (cfid) {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2701  		rc =3D SMB2_query_info_i=
nit(tcon, server,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2702  					  &rqst[1],
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2703  					  cfid->fid->persiste=
nt_fid,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2704  					  cfid->fid->volatile=
_fid,
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2705  					  class, type, 0,
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2706  					  output_len, 0,
f5b05d622a3e99 Ronnie Sahlberg 2018-10-07  2707  					  NULL);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2708  	} else {
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2709  		rc =3D SMB2_query_info_i=
nit(tcon, server,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2710  					  &rqst[1],
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2711  					  COMPOUND_FID,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2712  					  COMPOUND_FID,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2713  					  class, type, 0,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2714  					  output_len, 0,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2715  					  NULL);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2716  	}
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2717  	if (rc)
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2718  		goto qic_exit;
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2719  	if (!cfid) {
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  2720  		smb2_set_next_command(tc=
on, &rqst[1]);
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2721  		smb2_set_related(&rqst[1=
]);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2722  	}
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2723  =

730928c8f4be88 Ronnie Sahlberg 2018-08-08  2724  	memset(&close_iov, 0, siz=
eof(close_iov));
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2725  	rqst[2].rq_iov =3D close_=
iov;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2726  	rqst[2].rq_nvec =3D 1;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2727  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31  2728  	rc =3D SMB2_close_init(tc=
on, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2729  			     &rqst[2], COMPOUND=
_FID, COMPOUND_FID, false);
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2730  	if (rc)
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2731  		goto qic_exit;
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2732  	smb2_set_related(&rqst[2]=
);
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2733  =

c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2734  	if (cfid) {
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2735  		rc =3D compound_send_rec=
v(xid, ses, server,
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2736  					flags, 1, &rqst[1],
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2737  					&resp_buftype[1], &rs=
p_iov[1]);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2738  	} else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2739  		rc =3D compound_send_rec=
v(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2740  					flags, 3, rqst,
730928c8f4be88 Ronnie Sahlberg 2018-08-08  2741  					resp_buftype, rsp_iov=
);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2742  	}
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2743  	if (rc) {
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2744  		free_rsp_buf(resp_buftyp=
e[1], rsp_iov[1].iov_base);
7dcc82c2dfd5f1 Steve French    2019-09-11  2745  		if (rc =3D=3D -EREMCHG) {
7dcc82c2dfd5f1 Steve French    2019-09-11  2746  			tcon->need_reconnect =
=3D true;
a0a3036b81f1f6 Joe Perches     2020-04-14  2747  			pr_warn_once("server sh=
are %s deleted\n",
7dcc82c2dfd5f1 Steve French    2019-09-11  2748  				     tcon->treeName);
7dcc82c2dfd5f1 Steve French    2019-09-11  2749  		}
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2750  		goto qic_exit;
f9793b6fcc8ede Ronnie Sahlberg 2018-11-27  2751  	}
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2752  	*rsp =3D rsp_iov[1];
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2753  	*buftype =3D resp_buftype=
[1];
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2754  =

07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2755   qic_exit:
8f47432b25acf5 Ronnie Sahlberg 2022-03-22  2756  	kfree(utf16_path);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2757  	SMB2_open_free(&rqst[0]);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2758  	SMB2_query_info_free(&rqs=
t[1]);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2759  	SMB2_close_free(&rqst[2]);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2760  	free_rsp_buf(resp_buftype=
[0], rsp_iov[0].iov_base);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2761  	free_rsp_buf(resp_buftype=
[2], rsp_iov[2].iov_base);
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2762  	if(cfid)
c7550868b2ed88 Ronnie Sahlberg 2022-03-22  2763  		close_cached_dir(cfid);
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2764  	return rc;
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2765  }
07d3b2e4264fb3 Ronnie Sahlberg 2018-12-20  2766  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4961464867372274901==--


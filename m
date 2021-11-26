Content-Type: multipart/mixed; boundary="===============7076721092892243217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/xattr.c:182:5: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 14:44:14 +0800
Message-ID: <202111261440.46lnc92u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7076721092892243217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Boris Protopopov <pboris@amazon.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 3970acf7ddb9aa01c4bdeef197495157c98a15f6 SMB3: Add support for gett=
ing and setting SACLs
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c007-20211124 (https://download.01.org/0day-ci/ar=
chive/20211126/202111261440.46lnc92u-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c4=
5def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3970acf7ddb9aa01c4bdeef197495157c98a15f6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3970acf7ddb9aa01c4bdeef197495157c98a15f6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/crypto/keysetup_v1.c:63:8: note: Returned allocated memory
           req =3D skcipher_request_alloc(tfm, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/keysetup_v1.c:64:7: note: 'req' is non-null
           if (!req) {
                ^~~
   fs/crypto/keysetup_v1.c:64:2: note: Taking false branch
           if (!req) {
           ^
   fs/crypto/keysetup_v1.c:72:6: note: Assuming 'res' is < 0
           if (res < 0)
               ^~~~~~~
   fs/crypto/keysetup_v1.c:72:2: note: Taking true branch
           if (res < 0)
           ^
   fs/crypto/keysetup_v1.c:73:3: note: Control jumps to line 81
                   goto out;
                   ^
   fs/crypto/keysetup_v1.c:82:2: note: Potential leak of memory pointed to =
by 'req'
           crypto_free_skcipher(tfm);
           ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/acpi/thermal.c:1040:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tz->name, device->pnp.bus_id);
           ^~~~~~
   drivers/acpi/thermal.c:1040:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(tz->name, device->pnp.bus_id);
           ^~~~~~
   drivers/acpi/thermal.c:1041:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_THERMAL_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/thermal.c:1041:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_THERMAL_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/thermal.c:1042:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_THERMAL_CLASS);
           ^~~~~~
   drivers/acpi/thermal.c:1042:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_THERMAL_CLASS);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   fs/cifs/cifsacl.c:408:3: warning: Value stored to 'rc' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   rc =3D -EINVAL;
                   ^    ~~~~~~~
   fs/cifs/cifsacl.c:408:3: note: Value stored to 'rc' is never read
                   rc =3D -EINVAL;
                   ^    ~~~~~~~
   fs/cifs/cifsacl.c:421:3: warning: Value stored to 'rc' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   rc =3D -EIO;
                   ^    ~~~~
   fs/cifs/cifsacl.c:421:3: note: Value stored to 'rc' is never read
                   rc =3D -EIO;
                   ^    ~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> fs/cifs/xattr.c:182:5: warning: Value stored to 'rc' is never read [clan=
g-analyzer-deadcode.DeadStores]
                                   rc =3D 0;
                                   ^    ~
   fs/cifs/xattr.c:182:5: note: Value stored to 'rc' is never read
                                   rc =3D 0;
                                   ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/nsrepair.c:264:8: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                               return_object->common.reference_count;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:125:2: note: 'return_object' initialized =
here
           union acpi_operand_object *return_object =3D *return_object_ptr;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:139:6: note: Assuming 'predefined' is non=
-null
           if (predefined) {
               ^~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:139:2: note: Taking true branch
           if (predefined) {
           ^
   drivers/acpi/acpica/nsrepair.c:140:7: note: Assuming 'return_object' is =
null
                   if (!return_object) {
                       ^~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:140:3: note: Taking true branch
                   if (!return_object) {
                   ^
   drivers/acpi/acpica/nsrepair.c:148:7: note: Assuming 'status' is 0
                   if (ACPI_FAILURE(status)) {
                       ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/acpi/acpica/nsrepair.c:148:3: note: Taking false branch
                   if (ACPI_FAILURE(status)) {
                   ^
   drivers/acpi/acpica/nsrepair.c:156:7: note: Assuming 'new_object' is non=
-null
                   if (new_object) {
                       ^~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:156:3: note: Taking true branch
                   if (new_object) {
                   ^
   drivers/acpi/acpica/nsrepair.c:157:4: note: Control jumps to line 258
                           goto object_repaired;
                           ^
   drivers/acpi/acpica/nsrepair.c:258:6: note: Assuming the condition is tr=
ue
           if (package_index !=3D ACPI_NOT_PACKAGE_ELEMENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:258:2: note: Taking true branch
           if (package_index !=3D ACPI_NOT_PACKAGE_ELEMENT) {
           ^
   drivers/acpi/acpica/nsrepair.c:262:7: note: Assuming the condition is tr=
ue
                   if (!(info->return_flags & ACPI_OBJECT_WRAPPED)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:262:3: note: Taking true branch
                   if (!(info->return_flags & ACPI_OBJECT_WRAPPED)) {
                   ^
   drivers/acpi/acpica/nsrepair.c:264:8: note: Dereference of null pointer
                               return_object->common.reference_count;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/afs/rxrpc.c:345:4: warning: 1st function call argument is an uninitia=
lized value [clang-analyzer-core.CallAndMessage]
                           put_page(bv[loop].bv_page);
                           ^
   fs/afs/rxrpc.c:369:2: note: Assuming the condition is false
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1625:6: note: expanded from macro '_enter'
           if (unlikely(afs_debug & AFS_DEBUG_KENTER))     \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/afs/rxrpc.c:369:2: note: Taking true branch
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1625:2: note: expanded from macro '_enter'
           if (unlikely(afs_debug & AFS_DEBUG_KENTER))     \
           ^
   fs/afs/rxrpc.c:369:2: note: Loop condition is false.  Exiting loop
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1623:29: note: expanded from macro '_enter'
   #define _enter(FMT,...)                                 \

vim +/rc +182 fs/cifs/xattr.c

534bb0c7bdaf737 Andreas Gruenbacher 2016-04-14  102  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  103  static int cifs_xattr_=
set(const struct xattr_handler *handler,
5930122683dff58 Al Viro             2016-05-27  104  			  struct dentry *de=
ntry, struct inode *inode,
5930122683dff58 Al Viro             2016-05-27  105  			  const char *name,=
 const void *value,
5930122683dff58 Al Viro             2016-05-27  106  			  size_t size, int =
flags)
^1da177e4c3f415 Linus Torvalds      2005-04-16  107  {
^1da177e4c3f415 Linus Torvalds      2005-04-16  108  	int rc =3D -EOPNOTSUP=
P;
6d5786a34d98bff Pavel Shilovsky     2012-06-20  109  	unsigned int xid;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  110  	struct super_block *s=
b =3D dentry->d_sb;
5fdccfef483d088 Al Viro             2016-04-10  111  	struct cifs_sb_info *=
cifs_sb =3D CIFS_SB(sb);
7ffec372458d163 Jeff Layton         2010-09-29  112  	struct tcon_link *tli=
nk;
96daf2b09178d8e Steve French        2011-05-27  113  	struct cifs_tcon *pTc=
on;
^1da177e4c3f415 Linus Torvalds      2005-04-16  114  	char *full_path;
^1da177e4c3f415 Linus Torvalds      2005-04-16  115  =

7ffec372458d163 Jeff Layton         2010-09-29  116  	tlink =3D cifs_sb_tli=
nk(cifs_sb);
7ffec372458d163 Jeff Layton         2010-09-29  117  	if (IS_ERR(tlink))
7ffec372458d163 Jeff Layton         2010-09-29  118  		return PTR_ERR(tlink=
);
7ffec372458d163 Jeff Layton         2010-09-29  119  	pTcon =3D tlink_tcon(=
tlink);
7ffec372458d163 Jeff Layton         2010-09-29  120  =

6d5786a34d98bff Pavel Shilovsky     2012-06-20  121  	xid =3D get_xid();
^1da177e4c3f415 Linus Torvalds      2005-04-16  122  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  123  	full_path =3D build_p=
ath_from_dentry(dentry);
^1da177e4c3f415 Linus Torvalds      2005-04-16  124  	if (full_path =3D=3D =
NULL) {
0f3bc09ee1b7fca Suresh Jayaraman    2009-06-25  125  		rc =3D -ENOMEM;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  126  		goto out;
^1da177e4c3f415 Linus Torvalds      2005-04-16  127  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  128  	/* return dos attribu=
tes as pseudo xattr */
^1da177e4c3f415 Linus Torvalds      2005-04-16  129  	/* return alt name if=
 available as pseudo attr */
^1da177e4c3f415 Linus Torvalds      2005-04-16  130  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  131  	/* if proc/fs/cifs/st=
reamstoxattr is set then
^1da177e4c3f415 Linus Torvalds      2005-04-16  132  		search server for EA=
s or streams to
^1da177e4c3f415 Linus Torvalds      2005-04-16  133  		returns as xattrs */
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  134  	if (size > MAX_EA_VAL=
UE_SIZE) {
f96637be081141d Joe Perches         2013-05-04  135  		cifs_dbg(FYI, "size =
of EA value too large\n");
7ffec372458d163 Jeff Layton         2010-09-29  136  		rc =3D -EOPNOTSUPP;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  137  		goto out;
^1da177e4c3f415 Linus Torvalds      2005-04-16  138  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  139  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  140  	switch (handler->flag=
s) {
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  141  	case XATTR_USER:
438471b67963b82 Boris Protopopov    2019-12-19  142  		cifs_dbg(FYI, "%s:se=
tting user xattr %s\n", __func__, name);
438471b67963b82 Boris Protopopov    2019-12-19  143  		if ((strcmp(name, CI=
FS_XATTR_ATTRIB) =3D=3D 0) ||
438471b67963b82 Boris Protopopov    2019-12-19  144  		    (strcmp(name, SM=
B3_XATTR_ATTRIB) =3D=3D 0)) {
438471b67963b82 Boris Protopopov    2019-12-19  145  			rc =3D cifs_attrib_=
set(xid, pTcon, inode, full_path,
438471b67963b82 Boris Protopopov    2019-12-19  146  					value, size);
438471b67963b82 Boris Protopopov    2019-12-19  147  			if (rc =3D=3D 0) /*=
 force revalidate of the inode */
438471b67963b82 Boris Protopopov    2019-12-19  148  				CIFS_I(inode)->tim=
e =3D 0;
438471b67963b82 Boris Protopopov    2019-12-19  149  			break;
438471b67963b82 Boris Protopopov    2019-12-19  150  		} else if ((strcmp(n=
ame, CIFS_XATTR_CREATETIME) =3D=3D 0) ||
438471b67963b82 Boris Protopopov    2019-12-19  151  			   (strcmp(name, SM=
B3_XATTR_CREATETIME) =3D=3D 0)) {
438471b67963b82 Boris Protopopov    2019-12-19  152  			rc =3D cifs_creatio=
n_time_set(xid, pTcon, inode,
438471b67963b82 Boris Protopopov    2019-12-19  153  					full_path, value,=
 size);
438471b67963b82 Boris Protopopov    2019-12-19  154  			if (rc =3D=3D 0) /*=
 force revalidate of the inode */
438471b67963b82 Boris Protopopov    2019-12-19  155  				CIFS_I(inode)->tim=
e =3D 0;
438471b67963b82 Boris Protopopov    2019-12-19  156  			break;
438471b67963b82 Boris Protopopov    2019-12-19  157  		}
438471b67963b82 Boris Protopopov    2019-12-19  158  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  159  		if (cifs_sb->mnt_cif=
s_flags & CIFS_MOUNT_NO_XATTR)
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  160  			goto out;
ad7a2926b9e53cf Steve French        2008-02-07  161  =

666753c3ef8fc88 Steve French        2014-01-26  162  		if (pTcon->ses->serv=
er->ops->set_EA)
666753c3ef8fc88 Steve French        2014-01-26  163  			rc =3D pTcon->ses->=
server->ops->set_EA(xid, pTcon,
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  164  				full_path, name, v=
alue, (__u16)size,
5517554e43131f5 Ronnie Sahlberg     2017-08-24  165  				cifs_sb->local_nls=
, cifs_sb);
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  166  		break;
^1da177e4c3f415 Linus Torvalds      2005-04-16  167  =

438471b67963b82 Boris Protopopov    2019-12-19  168  	case XATTR_CIFS_ACL:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  169  	case XATTR_CIFS_NTSD:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  170  	case XATTR_CIFS_NTSD_=
FULL: {
b0f8ef202ec7f07 Santosh Nayak       2012-03-02  171  		struct cifs_ntsd *pa=
cl;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  172  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  173  		if (!value)
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  174  			goto out;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  175  		pacl =3D kmalloc(siz=
e, GFP_KERNEL);
b73b9a4ba753dfd Steve French        2011-04-19  176  		if (!pacl) {
b73b9a4ba753dfd Steve French        2011-04-19  177  			rc =3D -ENOMEM;
b73b9a4ba753dfd Steve French        2011-04-19  178  		} else {
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  179  			memcpy(pacl, value,=
 size);
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  180  			if (pTcon->ses->ser=
ver->ops->set_acl) {
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  181  				int aclflags =3D 0;
438471b67963b82 Boris Protopopov    2019-12-19 @182  				rc =3D 0;
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  183  =

3970acf7ddb9aa0 Boris Protopopov    2020-12-18  184  				switch (handler->f=
lags) {
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  185  				case XATTR_CIFS_NT=
SD_FULL:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  186  					aclflags =3D (CIF=
S_ACL_OWNER |
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  187  						    CIFS_ACL_DAC=
L |
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  188  						    CIFS_ACL_SAC=
L);
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  189  					break;
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  190  				case XATTR_CIFS_NT=
SD:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  191  					aclflags =3D (CIF=
S_ACL_OWNER |
438471b67963b82 Boris Protopopov    2019-12-19  192  						    CIFS_ACL_DAC=
L);
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  193  					break;
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  194  				case XATTR_CIFS_AC=
L:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  195  				default:
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  196  					aclflags =3D CIFS=
_ACL_DACL;
438471b67963b82 Boris Protopopov    2019-12-19  197  				}
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  198  =

3970acf7ddb9aa0 Boris Protopopov    2020-12-18  199  				rc =3D pTcon->ses-=
>server->ops->set_acl(pacl,
3970acf7ddb9aa0 Boris Protopopov    2020-12-18  200  					size, inode, full=
_path, aclflags);
438471b67963b82 Boris Protopopov    2019-12-19  201  			} else {
83e3bc23ef9ce7c Steve French        2014-02-02  202  				rc =3D -EOPNOTSUPP;
438471b67963b82 Boris Protopopov    2019-12-19  203  			}
b73b9a4ba753dfd Steve French        2011-04-19  204  			if (rc =3D=3D 0) /*=
 force revalidate of the inode */
5930122683dff58 Al Viro             2016-05-27  205  				CIFS_I(inode)->tim=
e =3D 0;
b73b9a4ba753dfd Steve French        2011-04-19  206  			kfree(pacl);
b0f8ef202ec7f07 Santosh Nayak       2012-03-02  207  		}
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  208  		break;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  209  	}
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  210  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  211  	case XATTR_ACL_ACCESS:
^1da177e4c3f415 Linus Torvalds      2005-04-16  212  #ifdef CONFIG_CIFS_POS=
IX
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  213  		if (!value)
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  214  			goto out;
1751e8a6cb935e5 Linus Torvalds      2017-11-27  215  		if (sb->s_flags & SB=
_POSIXACL)
1da0c78b32abe12 Steve French        2005-04-28  216  			rc =3D CIFSSMBSetPo=
sixACL(xid, pTcon, full_path,
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  217  				value, (const int)=
size,
737b758c965a9b2 Steve French        2005-04-28  218  				ACL_TYPE_ACCESS, c=
ifs_sb->local_nls,
2baa2682531ff02 Steve French        2014-09-27  219  				cifs_remap(cifs_sb=
));
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  220  #endif  /* CONFIG_CIFS=
_POSIX */
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  221  		break;
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  222  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  223  	case XATTR_ACL_DEFAUL=
T:
^1da177e4c3f415 Linus Torvalds      2005-04-16  224  #ifdef CONFIG_CIFS_POS=
IX
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  225  		if (!value)
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  226  			goto out;
1751e8a6cb935e5 Linus Torvalds      2017-11-27  227  		if (sb->s_flags & SB=
_POSIXACL)
1da0c78b32abe12 Steve French        2005-04-28  228  			rc =3D CIFSSMBSetPo=
sixACL(xid, pTcon, full_path,
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  229  				value, (const int)=
size,
737b758c965a9b2 Steve French        2005-04-28  230  				ACL_TYPE_DEFAULT, =
cifs_sb->local_nls,
2baa2682531ff02 Steve French        2014-09-27  231  				cifs_remap(cifs_sb=
));
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  232  #endif  /* CONFIG_CIFS=
_POSIX */
a9ae008f407b50f Andreas Gruenbacher 2016-04-22  233  		break;
^1da177e4c3f415 Linus Torvalds      2005-04-16  234  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  235  =

a9ae008f407b50f Andreas Gruenbacher 2016-04-22  236  out:
^1da177e4c3f415 Linus Torvalds      2005-04-16  237  	kfree(full_path);
6d5786a34d98bff Pavel Shilovsky     2012-06-20  238  	free_xid(xid);
7ffec372458d163 Jeff Layton         2010-09-29  239  	cifs_put_tlink(tlink);
^1da177e4c3f415 Linus Torvalds      2005-04-16  240  	return rc;
^1da177e4c3f415 Linus Torvalds      2005-04-16  241  }
^1da177e4c3f415 Linus Torvalds      2005-04-16  242  =


:::::: The code at line 182 was first introduced by commit
:::::: 438471b67963b8267e94beab383b6d6fc41b3481 CIFS: Add support for setti=
ng owner info, dos attributes, and create time

:::::: TO: Boris Protopopov <bprotopopov@hotmail.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7076721092892243217==--


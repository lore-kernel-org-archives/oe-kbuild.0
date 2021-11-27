Content-Type: multipart/mixed; boundary="===============1677040880413757736=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ksmbd/oplock.c:988 find_same_lease_key() warn: missing error code 'err'
Date: Sun, 28 Nov 2021 04:27:43 +0800
Message-ID: <202111280419.zYaoW47p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1677040880413757736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 1a93084b9a89818aec0ac7b59a5a51f2112bf203 ksmbd: move fs/cifsd to fs=
/ksmbd
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-m001-20211118 (https://download.01.org/0day-ci/ar=
chive/20211128/202111280419.zYaoW47p-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/ksmbd/oplock.c:988 find_same_lease_key() warn: missing error code 'err'

vim +/err +988 fs/ksmbd/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   955  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   956  int find_sam=
e_lease_key(struct ksmbd_session *sess, struct ksmbd_inode *ci,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   957  			struct le=
ase_ctx_info *lctx)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   958  {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   959  	struct oplo=
ck_info *opinfo;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   960  	int err =3D=
 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   961  	struct leas=
e_table *lb;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   962  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   963  	if (!lctx)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   964  		return err;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   965  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   966  	read_lock(&=
lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   967  	if (list_em=
pty(&lease_table_list)) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   968  		read_unloc=
k(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   969  		return 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   970  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   971  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   972  	list_for_ea=
ch_entry(lb, &lease_table_list, l_entry) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   973  		if (!memcm=
p(lb->client_guid, sess->conn->ClientGUID,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   974  			    SMB2_=
CLIENT_GUID_SIZE))
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   975  			goto foun=
d;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   976  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   977  	read_unlock=
(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   978  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   979  	return 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   980  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   981  found:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   982  	rcu_read_lo=
ck();
070fb21e5912b6 fs/cifsd/oplock.c Namjae Jeon 2021-05-26   983  	list_for_ea=
ch_entry_rcu(opinfo, &lb->lease_list, lease_entry) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   984  		if (!atomi=
c_inc_not_zero(&opinfo->refcount))
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   985  			continue;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   986  		rcu_read_u=
nlock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   987  		if (opinfo=
->o_fp->f_ci =3D=3D ci)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  @988  			goto op_n=
ext;
070fb21e5912b6 fs/cifsd/oplock.c Namjae Jeon 2021-05-26   989  		err =3D co=
mpare_guid_key(opinfo, sess->conn->ClientGUID,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   990  				       l=
ctx->lease_key);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   991  		if (err) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   992  			err =3D -=
EINVAL;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   993  			ksmbd_deb=
ug(OPLOCK,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   994  				    "fou=
nd same lease key is already used in other files\n");
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   995  			opinfo_pu=
t(opinfo);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   996  			goto out;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   997  		}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   998  op_next:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   999  		opinfo_put=
(opinfo);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1000  		rcu_read_l=
ock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1001  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1002  	rcu_read_un=
lock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1003  =

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1004  out:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1005  	read_unlock=
(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1006  	return err;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1007  }
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1008  =


:::::: The code at line 988 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1677040880413757736==--


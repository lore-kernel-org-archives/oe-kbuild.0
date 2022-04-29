Content-Type: multipart/mixed; boundary="===============5758454434048194764=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ksmbd/oplock.c:988 find_same_lease_key() warn: missing error code 'err'
Date: Sat, 30 Apr 2022 07:05:09 +0800
Message-ID: <202204300628.lxnNtMag-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5758454434048194764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2d0de93ca2515958e717138e5ee07ec3b6bf0226
commit: 1a93084b9a89818aec0ac7b59a5a51f2112bf203 ksmbd: move fs/cifsd to fs=
/ksmbd
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-m031-20220428 (https://download.01.org/0day-ci/arc=
hive/20220430/202204300628.lxnNtMag-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/ksmbd/oplock.c:988 find_same_lease_key() warn: missing error code 'err'

vim +/err +988 fs/ksmbd/oplock.c

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   955  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   956  int find_sa=
me_lease_key(struct ksmbd_session *sess, struct ksmbd_inode *ci,
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   957  			struct l=
ease_ctx_info *lctx)
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   958  {
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   959  	struct opl=
ock_info *opinfo;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   960  	int err =
=3D 0;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   961  	struct lea=
se_table *lb;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   962  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   963  	if (!lctx)
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   964  		return er=
r;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   965  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   966  	read_lock(=
&lease_list_lock);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   967  	if (list_e=
mpty(&lease_table_list)) {
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   968  		read_unlo=
ck(&lease_list_lock);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   969  		return 0;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   970  	}
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   971  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   972  	list_for_e=
ach_entry(lb, &lease_table_list, l_entry) {
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   973  		if (!memc=
mp(lb->client_guid, sess->conn->ClientGUID,
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   974  			    SMB2=
_CLIENT_GUID_SIZE))
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   975  			goto fou=
nd;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   976  	}
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   977  	read_unloc=
k(&lease_list_lock);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   978  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   979  	return 0;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   980  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   981  found:
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   982  	rcu_read_l=
ock();
070fb21e5912b6a fs/cifsd/oplock.c Namjae Jeon 2021-05-26   983  	list_for_e=
ach_entry_rcu(opinfo, &lb->lease_list, lease_entry) {
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   984  		if (!atom=
ic_inc_not_zero(&opinfo->refcount))
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   985  			continue;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   986  		rcu_read_=
unlock();
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   987  		if (opinf=
o->o_fp->f_ci =3D=3D ci)
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  @988  			goto op_=
next;
070fb21e5912b6a fs/cifsd/oplock.c Namjae Jeon 2021-05-26   989  		err =3D c=
ompare_guid_key(opinfo, sess->conn->ClientGUID,
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   990  				       =
lctx->lease_key);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   991  		if (err) {
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   992  			err =3D =
-EINVAL;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   993  			ksmbd_de=
bug(OPLOCK,
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   994  				    "fo=
und same lease key is already used in other files\n");
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   995  			opinfo_p=
ut(opinfo);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   996  			goto out;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   997  		}
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   998  op_next:
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16   999  		opinfo_pu=
t(opinfo);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1000  		rcu_read_=
lock();
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1001  	}
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1002  	rcu_read_u=
nlock();
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1003  =

e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1004  out:
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1005  	read_unloc=
k(&lease_list_lock);
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1006  	return err;
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1007  }
e2f34481b24db2f fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1008  =


:::::: The code at line 988 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5758454434048194764==--


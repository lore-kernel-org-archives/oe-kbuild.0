Content-Type: multipart/mixed; boundary="===============3108565205712295176=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/nfsd/nfs4recover.c:814 __cld_pipe_inprogress_downcall() error: uninitialized symbol 'princhashlen'.
Date: Wed, 13 Jul 2022 21:49:18 +0800
Message-ID: <202207132125.6mLS6KnE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3108565205712295176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: a97b693c3712f040c5802f32b2d685352e08cefa uaccess: fix nios2 and mic=
roblaze get_user_8()
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: nios2-randconfig-m031-20220712 (https://download.01.org/0day-ci/arc=
hive/20220713/202207132125.6mLS6KnE-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nfsd/nfs4recover.c:814 __cld_pipe_inprogress_downcall() error: uninitial=
ized symbol 'princhashlen'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/princhashlen +814 fs/nfsd/nfs4recover.c

f3f8014862d813c Jeff Layton  2012-03-21  788  =

74725959c33c141 Scott Mayhew 2019-03-26  789  static ssize_t
6ee95d1c899186c Scott Mayhew 2019-09-09  790  __cld_pipe_inprogress_downcal=
l(const struct cld_msg_v2 __user *cmsg,
74725959c33c141 Scott Mayhew 2019-03-26  791  		struct nfsd_net *nn)
74725959c33c141 Scott Mayhew 2019-03-26  792  {
6ee95d1c899186c Scott Mayhew 2019-09-09  793  	uint8_t cmd, princhashlen;
6ee95d1c899186c Scott Mayhew 2019-09-09  794  	struct xdr_netobj name, prin=
chash =3D { .len =3D 0, .data =3D NULL };
74725959c33c141 Scott Mayhew 2019-03-26  795  	uint16_t namelen;
8a9f4f41248a4dc Scott Mayhew 2019-03-26  796  	struct cld_net *cn =3D nn->c=
ld_net;
74725959c33c141 Scott Mayhew 2019-03-26  797  =

74725959c33c141 Scott Mayhew 2019-03-26  798  	if (get_user(cmd, &cmsg->cm_=
cmd)) {
74725959c33c141 Scott Mayhew 2019-03-26  799  		dprintk("%s: error when cop=
ying cmd from userspace", __func__);
74725959c33c141 Scott Mayhew 2019-03-26  800  		return -EFAULT;
74725959c33c141 Scott Mayhew 2019-03-26  801  	}
74725959c33c141 Scott Mayhew 2019-03-26  802  	if (cmd =3D=3D Cld_GraceStar=
t) {
6ee95d1c899186c Scott Mayhew 2019-09-09  803  		if (nn->client_tracking_ops=
->version >=3D 2) {
6ee95d1c899186c Scott Mayhew 2019-09-09  804  			const struct cld_clntinfo =
__user *ci;
6ee95d1c899186c Scott Mayhew 2019-09-09  805  =

6ee95d1c899186c Scott Mayhew 2019-09-09  806  			ci =3D &cmsg->cm_u.cm_clnt=
info;
6ee95d1c899186c Scott Mayhew 2019-09-09  807  			if (get_user(namelen, &ci-=
>cc_name.cn_len))
6ee95d1c899186c Scott Mayhew 2019-09-09  808  				return -EFAULT;
6ee95d1c899186c Scott Mayhew 2019-09-09  809  			name.data =3D memdup_user(=
&ci->cc_name.cn_id, namelen);
6ee95d1c899186c Scott Mayhew 2019-09-09  810  			if (IS_ERR_OR_NULL(name.da=
ta))
6ee95d1c899186c Scott Mayhew 2019-09-09  811  				return -EFAULT;
6ee95d1c899186c Scott Mayhew 2019-09-09  812  			name.len =3D namelen;
6ee95d1c899186c Scott Mayhew 2019-09-09  813  			get_user(princhashlen, &ci=
->cc_princhash.cp_len);
6ee95d1c899186c Scott Mayhew 2019-09-09 @814  			if (princhashlen > 0) {
6ee95d1c899186c Scott Mayhew 2019-09-09  815  				princhash.data =3D memdup=
_user(
6ee95d1c899186c Scott Mayhew 2019-09-09  816  						&ci->cc_princhash.cp_da=
ta,
6ee95d1c899186c Scott Mayhew 2019-09-09  817  						princhashlen);
6ee95d1c899186c Scott Mayhew 2019-09-09  818  				if (IS_ERR_OR_NULL(princh=
ash.data))
6ee95d1c899186c Scott Mayhew 2019-09-09  819  					return -EFAULT;
6ee95d1c899186c Scott Mayhew 2019-09-09  820  				princhash.len =3D princha=
shlen;
6ee95d1c899186c Scott Mayhew 2019-09-09  821  			} else
6ee95d1c899186c Scott Mayhew 2019-09-09  822  				princhash.len =3D 0;
6ee95d1c899186c Scott Mayhew 2019-09-09  823  		} else {
6ee95d1c899186c Scott Mayhew 2019-09-09  824  			const struct cld_name __us=
er *cnm;
6ee95d1c899186c Scott Mayhew 2019-09-09  825  =

6ee95d1c899186c Scott Mayhew 2019-09-09  826  			cnm =3D &cmsg->cm_u.cm_nam=
e;
6ee95d1c899186c Scott Mayhew 2019-09-09  827  			if (get_user(namelen, &cnm=
->cn_len))
74725959c33c141 Scott Mayhew 2019-03-26  828  				return -EFAULT;
6ee95d1c899186c Scott Mayhew 2019-09-09  829  			name.data =3D memdup_user(=
&cnm->cn_id, namelen);
74725959c33c141 Scott Mayhew 2019-03-26  830  			if (IS_ERR_OR_NULL(name.da=
ta))
74725959c33c141 Scott Mayhew 2019-03-26  831  				return -EFAULT;
74725959c33c141 Scott Mayhew 2019-03-26  832  			name.len =3D namelen;
6ee95d1c899186c Scott Mayhew 2019-09-09  833  		}
8a9f4f41248a4dc Scott Mayhew 2019-03-26  834  		if (name.len > 5 && memcmp(=
name.data, "hash:", 5) =3D=3D 0) {
8a9f4f41248a4dc Scott Mayhew 2019-03-26  835  			name.len =3D name.len - 5;
8a9f4f41248a4dc Scott Mayhew 2019-03-26  836  			memmove(name.data, name.da=
ta + 5, name.len);
8a9f4f41248a4dc Scott Mayhew 2019-03-26  837  			cn->cn_has_legacy =3D true;
8a9f4f41248a4dc Scott Mayhew 2019-03-26  838  		}
6ee95d1c899186c Scott Mayhew 2019-09-09  839  		if (!nfs4_client_to_reclaim=
(name, princhash, nn)) {
74725959c33c141 Scott Mayhew 2019-03-26  840  			kfree(name.data);
6ee95d1c899186c Scott Mayhew 2019-09-09  841  			kfree(princhash.data);
74725959c33c141 Scott Mayhew 2019-03-26  842  			return -EFAULT;
74725959c33c141 Scott Mayhew 2019-03-26  843  		}
11a60d159259dba Scott Mayhew 2019-09-09  844  		return nn->client_tracking_=
ops->msglen;
74725959c33c141 Scott Mayhew 2019-03-26  845  	}
74725959c33c141 Scott Mayhew 2019-03-26  846  	return -EFAULT;
74725959c33c141 Scott Mayhew 2019-03-26  847  }
74725959c33c141 Scott Mayhew 2019-03-26  848  =


:::::: The code at line 814 was first introduced by commit
:::::: 6ee95d1c899186c0798cafd25998d436bcdb9618 nfsd: add support for upcal=
l version 2

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3108565205712295176==--


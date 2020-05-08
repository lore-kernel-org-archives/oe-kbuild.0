Content-Type: multipart/mixed; boundary="===============8532741522381899939=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 5983/7905] drivers/infiniband/sw/rxe/rxe_queue.c:69 do_mmap_info() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Sat, 09 May 2020 05:51:19 +0800
Message-ID: <202005090549.0heu3oQE%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8532741522381899939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: a3a974b4654d2bc367d14b555d06d8e477b7e702 [5983/7905] RDMA/rxe: Alwa=
ys return ERR_PTR from rxe_create_mmap_info()
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/sw/rxe/rxe_queue.c:69 do_mmap_info() warn: maybe return =
-EFAULT instead of the bytes remaining?

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Da3a974b4654d2bc367d14b555d06d8e477b7e702
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout a3a974b4654d2bc367d14b555d06d8e477b7e702
vim +69 drivers/infiniband/sw/rxe/rxe_queue.c

8700e3e7c4857d Moni Shoua         2016-06-16  38  =

ff23dfa134576e Shamir Rabinovitch 2019-03-31  39  int do_mmap_info(struct r=
xe_dev *rxe, struct mminfo __user *outbuf,
ff23dfa134576e Shamir Rabinovitch 2019-03-31  40  		 struct ib_udata *udata=
, struct rxe_queue_buf *buf,
ff23dfa134576e Shamir Rabinovitch 2019-03-31  41  		 size_t buf_size, struc=
t rxe_mmap_info **ip_p)
8700e3e7c4857d Moni Shoua         2016-06-16  42  {
8700e3e7c4857d Moni Shoua         2016-06-16  43  	int err;
8700e3e7c4857d Moni Shoua         2016-06-16  44  	struct rxe_mmap_info *ip=
 =3D NULL;
8700e3e7c4857d Moni Shoua         2016-06-16  45  =

0c43ab371bcb07 Jason Gunthorpe    2018-03-13  46  	if (outbuf) {
ff23dfa134576e Shamir Rabinovitch 2019-03-31  47  		ip =3D rxe_create_mmap_=
info(rxe, buf_size, udata, buf);
a3a974b4654d2b Sudip Mukherjee    2020-04-26  48  		if (IS_ERR(ip)) {
a3a974b4654d2b Sudip Mukherjee    2020-04-26  49  			err =3D PTR_ERR(ip);
8700e3e7c4857d Moni Shoua         2016-06-16  50  			goto err1;
a3a974b4654d2b Sudip Mukherjee    2020-04-26  51  		}
8700e3e7c4857d Moni Shoua         2016-06-16  52  =

0c43ab371bcb07 Jason Gunthorpe    2018-03-13  53  		err =3D copy_to_user(ou=
tbuf, &ip->info, sizeof(ip->info));
8700e3e7c4857d Moni Shoua         2016-06-16  54  		if (err)
8700e3e7c4857d Moni Shoua         2016-06-16  55  			goto err2;
8700e3e7c4857d Moni Shoua         2016-06-16  56  =

8700e3e7c4857d Moni Shoua         2016-06-16  57  		spin_lock_bh(&rxe->pend=
ing_lock);
8700e3e7c4857d Moni Shoua         2016-06-16  58  		list_add(&ip->pending_m=
maps, &rxe->pending_mmaps);
8700e3e7c4857d Moni Shoua         2016-06-16  59  		spin_unlock_bh(&rxe->pe=
nding_lock);
8700e3e7c4857d Moni Shoua         2016-06-16  60  	}
8700e3e7c4857d Moni Shoua         2016-06-16  61  =

8700e3e7c4857d Moni Shoua         2016-06-16  62  	*ip_p =3D ip;
8700e3e7c4857d Moni Shoua         2016-06-16  63  =

8700e3e7c4857d Moni Shoua         2016-06-16  64  	return 0;
8700e3e7c4857d Moni Shoua         2016-06-16  65  =

8700e3e7c4857d Moni Shoua         2016-06-16  66  err2:
8700e3e7c4857d Moni Shoua         2016-06-16  67  	kfree(ip);
8700e3e7c4857d Moni Shoua         2016-06-16  68  err1:
a3a974b4654d2b Sudip Mukherjee    2020-04-26 @69  	return err;
8700e3e7c4857d Moni Shoua         2016-06-16  70  }
8700e3e7c4857d Moni Shoua         2016-06-16  71  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8532741522381899939==--


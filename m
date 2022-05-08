Content-Type: multipart/mixed; boundary="===============8278238797773675258=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/sw/rxe/rxe_mcast.c:361:63: warning: Parameter 'qp' can be declared with const [constParameter]
Date: Sun, 08 May 2022 13:04:20 +0800
Message-ID: <202205081202.ida8EmI4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8278238797773675258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bob Pearson <rpearsonhpe@gmail.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: a181c4c81a7104370c6144df5daf914780f8e89e RDMA/rxe: Collect cleanup =
mca code in a subroutine
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a181c4c81a7104370c6144df5daf914780f8e89e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/infiniband/sw/rxe/rxe_mcast.c:361:63: warning: Parameter 'qp' ca=
n be declared with const [constParameter]
   static int rxe_detach_mcg(struct rxe_dev *rxe, struct rxe_qp *qp,
                                                                 ^
>> drivers/infiniband/sw/rxe/rxe_mcast.c:312:12: warning: Uninitialized var=
iable: mca->qp [uninitvar]
     if (mca->qp =3D=3D qp) {
              ^
   drivers/infiniband/sw/rxe/rxe_mcast.c:374:12: warning: Uninitialized var=
iable: mca->qp [uninitvar]
     if (mca->qp =3D=3D qp) {
              ^
   drivers/infiniband/sw/rxe/rxe_mcast.c:369:6: note: Assuming condition is=
 false
    if (!mcg)
        ^
   drivers/infiniband/sw/rxe/rxe_mcast.c:374:12: note: Uninitialized variab=
le: mca->qp
     if (mca->qp =3D=3D qp) {
              ^
--
>> drivers/infiniband/sw/siw/siw_cm.c:1000:45: warning: Uninitialized varia=
ble: work [uninitvar]
    work =3D container_of(w, struct siw_cm_work, work.work);
                                               ^

vim +/qp +361 drivers/infiniband/sw/rxe/rxe_mcast.c

4a4f1073475796 Bob Pearson 2022-02-23  301  =

5bc15d1f7e3c9b Bob Pearson 2022-02-08  302  static int rxe_attach_mcg(struc=
t rxe_dev *rxe, struct rxe_qp *qp,
5bc15d1f7e3c9b Bob Pearson 2022-02-08  303  				  struct rxe_mcg *mcg)
8700e3e7c4857d Moni Shoua  2016-06-16  304  {
d572405518ffd7 Bob Pearson 2022-02-08  305  	struct rxe_mca *mca, *tmp;
a099b08599e6ae Bob Pearson 2022-02-15  306  	unsigned long flags;
d572405518ffd7 Bob Pearson 2022-02-08  307  	int err;
8700e3e7c4857d Moni Shoua  2016-06-16  308  =

d572405518ffd7 Bob Pearson 2022-02-08  309  	/* check to see if the qp is a=
lready a member of the group */
9fd0eb7c3c73c8 Bob Pearson 2022-02-08  310  	spin_lock_irqsave(&rxe->mcg_lo=
ck, flags);
5bc15d1f7e3c9b Bob Pearson 2022-02-08  311  	list_for_each_entry(mca, &mcg-=
>qp_list, qp_list) {
d572405518ffd7 Bob Pearson 2022-02-08 @312  		if (mca->qp =3D=3D qp) {
d572405518ffd7 Bob Pearson 2022-02-08  313  			spin_unlock_irqrestore(&rxe-=
>mcg_lock, flags);
d572405518ffd7 Bob Pearson 2022-02-08  314  			return 0;
8700e3e7c4857d Moni Shoua  2016-06-16  315  		}
8700e3e7c4857d Moni Shoua  2016-06-16  316  	}
d572405518ffd7 Bob Pearson 2022-02-08  317  	spin_unlock_irqrestore(&rxe->m=
cg_lock, flags);
8700e3e7c4857d Moni Shoua  2016-06-16  318  =

d572405518ffd7 Bob Pearson 2022-02-08  319  	/* speculative alloc new mca w=
ithout using GFP_ATOMIC */
d572405518ffd7 Bob Pearson 2022-02-08  320  	mca =3D kzalloc(sizeof(*mca), =
GFP_KERNEL);
d572405518ffd7 Bob Pearson 2022-02-08  321  	if (!mca)
d572405518ffd7 Bob Pearson 2022-02-08  322  		return -ENOMEM;
d572405518ffd7 Bob Pearson 2022-02-08  323  =

d572405518ffd7 Bob Pearson 2022-02-08  324  	spin_lock_irqsave(&rxe->mcg_lo=
ck, flags);
d572405518ffd7 Bob Pearson 2022-02-08  325  	/* re-check to see if someone =
else just attached qp */
5bc15d1f7e3c9b Bob Pearson 2022-02-08  326  	list_for_each_entry(tmp, &mcg-=
>qp_list, qp_list) {
d572405518ffd7 Bob Pearson 2022-02-08  327  		if (tmp->qp =3D=3D qp) {
d572405518ffd7 Bob Pearson 2022-02-08  328  			kfree(mca);
d572405518ffd7 Bob Pearson 2022-02-08  329  			err =3D 0;
8700e3e7c4857d Moni Shoua  2016-06-16  330  			goto out;
8700e3e7c4857d Moni Shoua  2016-06-16  331  		}
d572405518ffd7 Bob Pearson 2022-02-08  332  	}
8700e3e7c4857d Moni Shoua  2016-06-16  333  =

4a4f1073475796 Bob Pearson 2022-02-23  334  	err =3D __rxe_init_mca(qp, mcg=
, mca);
4a4f1073475796 Bob Pearson 2022-02-23  335  	if (err)
d572405518ffd7 Bob Pearson 2022-02-08  336  		kfree(mca);
8700e3e7c4857d Moni Shoua  2016-06-16  337  out:
9fd0eb7c3c73c8 Bob Pearson 2022-02-08  338  	spin_unlock_irqrestore(&rxe->m=
cg_lock, flags);
8700e3e7c4857d Moni Shoua  2016-06-16  339  	return err;
8700e3e7c4857d Moni Shoua  2016-06-16  340  }
8700e3e7c4857d Moni Shoua  2016-06-16  341  =

a181c4c81a7104 Bob Pearson 2022-02-23  342  /**
a181c4c81a7104 Bob Pearson 2022-02-23  343   * __rxe_cleanup_mca - cleanup =
mca object holding lock
a181c4c81a7104 Bob Pearson 2022-02-23  344   * @mca: mca object
a181c4c81a7104 Bob Pearson 2022-02-23  345   * @mcg: mcg object
a181c4c81a7104 Bob Pearson 2022-02-23  346   *
a181c4c81a7104 Bob Pearson 2022-02-23  347   * Context: caller must hold a =
reference to mcg and rxe->mcg_lock
a181c4c81a7104 Bob Pearson 2022-02-23  348   */
a181c4c81a7104 Bob Pearson 2022-02-23  349  static void __rxe_cleanup_mca(s=
truct rxe_mca *mca, struct rxe_mcg *mcg)
a181c4c81a7104 Bob Pearson 2022-02-23  350  {
a181c4c81a7104 Bob Pearson 2022-02-23  351  	list_del(&mca->qp_list);
a181c4c81a7104 Bob Pearson 2022-02-23  352  =

a181c4c81a7104 Bob Pearson 2022-02-23  353  	atomic_dec(&mcg->qp_num);
a181c4c81a7104 Bob Pearson 2022-02-23  354  	atomic_dec(&mcg->rxe->mcg_atta=
ch);
a181c4c81a7104 Bob Pearson 2022-02-23  355  	atomic_dec(&mca->qp->mcg_num);
a181c4c81a7104 Bob Pearson 2022-02-23  356  	rxe_drop_ref(mca->qp);
a181c4c81a7104 Bob Pearson 2022-02-23  357  =

a181c4c81a7104 Bob Pearson 2022-02-23  358  	kfree(mca);
a181c4c81a7104 Bob Pearson 2022-02-23  359  }
a181c4c81a7104 Bob Pearson 2022-02-23  360  =

5bc15d1f7e3c9b Bob Pearson 2022-02-08 @361  static int rxe_detach_mcg(struc=
t rxe_dev *rxe, struct rxe_qp *qp,
8700e3e7c4857d Moni Shoua  2016-06-16  362  				   union ib_gid *mgid)
8700e3e7c4857d Moni Shoua  2016-06-16  363  {
5bc15d1f7e3c9b Bob Pearson 2022-02-08  364  	struct rxe_mcg *mcg;
d572405518ffd7 Bob Pearson 2022-02-08  365  	struct rxe_mca *mca, *tmp;
a099b08599e6ae Bob Pearson 2022-02-15  366  	unsigned long flags;
8700e3e7c4857d Moni Shoua  2016-06-16  367  =

8a0a5fe0c46243 Bob Pearson 2022-02-08  368  	mcg =3D rxe_lookup_mcg(rxe, mg=
id);
8a0a5fe0c46243 Bob Pearson 2022-02-08  369  	if (!mcg)
8a0a5fe0c46243 Bob Pearson 2022-02-08  370  		return -EINVAL;
d572405518ffd7 Bob Pearson 2022-02-08  371  =

8a0a5fe0c46243 Bob Pearson 2022-02-08  372  	spin_lock_irqsave(&rxe->mcg_lo=
ck, flags);
5bc15d1f7e3c9b Bob Pearson 2022-02-08  373  	list_for_each_entry_safe(mca, =
tmp, &mcg->qp_list, qp_list) {
d572405518ffd7 Bob Pearson 2022-02-08  374  		if (mca->qp =3D=3D qp) {
a181c4c81a7104 Bob Pearson 2022-02-23  375  			__rxe_cleanup_mca(mca, mcg);
d572405518ffd7 Bob Pearson 2022-02-08  376  =

d572405518ffd7 Bob Pearson 2022-02-08  377  			/* if the number of qp's att=
ached to the
d572405518ffd7 Bob Pearson 2022-02-08  378  			 * mcast group falls to zero=
 go ahead and
d572405518ffd7 Bob Pearson 2022-02-08  379  			 * tear it down. This will n=
ot free the
d572405518ffd7 Bob Pearson 2022-02-08  380  			 * object since we are still=
 holding a ref
a181c4c81a7104 Bob Pearson 2022-02-23  381  			 * from the get key above
d572405518ffd7 Bob Pearson 2022-02-08  382  			 */
a181c4c81a7104 Bob Pearson 2022-02-23  383  			if (atomic_read(&mcg->qp_num=
) <=3D 0)
5bc15d1f7e3c9b Bob Pearson 2022-02-08  384  				__rxe_destroy_mcg(mcg);
d572405518ffd7 Bob Pearson 2022-02-08  385  =

d572405518ffd7 Bob Pearson 2022-02-08  386  			/* drop the ref from get key=
. This will free the
8a0a5fe0c46243 Bob Pearson 2022-02-08  387  			 * object if qp_num is zero.
d572405518ffd7 Bob Pearson 2022-02-08  388  			 */
3810c1a1cbe8f3 Bob Pearson 2022-02-08  389  			kref_put(&mcg->ref_cnt, rxe_=
cleanup_mcg);
a181c4c81a7104 Bob Pearson 2022-02-23  390  =

a181c4c81a7104 Bob Pearson 2022-02-23  391  			spin_unlock_irqrestore(&rxe-=
>mcg_lock, flags);
a181c4c81a7104 Bob Pearson 2022-02-23  392  			return 0;
8700e3e7c4857d Moni Shoua  2016-06-16  393  		}
8700e3e7c4857d Moni Shoua  2016-06-16  394  	}
8700e3e7c4857d Moni Shoua  2016-06-16  395  =

d572405518ffd7 Bob Pearson 2022-02-08  396  	/* we didn't find the qp on th=
e list */
d572405518ffd7 Bob Pearson 2022-02-08  397  	spin_unlock_irqrestore(&rxe->m=
cg_lock, flags);
a181c4c81a7104 Bob Pearson 2022-02-23  398  	return -EINVAL;
8700e3e7c4857d Moni Shoua  2016-06-16  399  }
758c7f1e9cc9f1 Bob Pearson 2022-01-27  400  =


:::::: The code at line 361 was first introduced by commit
:::::: 5bc15d1f7e3c9b84b40e020983e2cee19a546e72 RDMA/rxe: Replace grp by mc=
g, mce by mca

:::::: TO: Bob Pearson <rpearsonhpe@gmail.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8278238797773675258==--


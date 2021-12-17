Content-Type: multipart/mixed; boundary="===============0756124997353326638=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.17/block 106/108] block/blk-ioc.c:307 set_task_ioprio() error: we previously assumed 'task->io_context' could be null (see line 300)
Date: Fri, 17 Dec 2021 15:40:28 +0800
Message-ID: <202112171520.5hNnOM0q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0756124997353326638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.17/block
head:   5ef1630586317e92c9ebd7b4ce48f393b7ff790f
commit: 5fc11eebb4a98df5324a4de369bb5ab7f0007ff7 [106/108] block: open code=
 create_task_io_context in set_task_ioprio
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021-20211216 (https://download.01.org/0day-ci/arch=
ive/20211217/202112171520.5hNnOM0q-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
block/blk-ioc.c:307 set_task_ioprio() error: we previously assumed 'task->i=
o_context' could be null (see line 300)

vim +307 block/blk-ioc.c

86db1e29772372 Jens Axboe        2008-01-29  270  =

a411cd3cfdc5bb Christoph Hellwig 2021-12-09  271  int set_task_ioprio(struc=
t task_struct *task, int ioprio)
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  272  {
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  273  	int err;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  274  	const struct cred *cred =
=3D current_cred(), *tcred;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  275  =

a411cd3cfdc5bb Christoph Hellwig 2021-12-09  276  	rcu_read_lock();
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  277  	tcred =3D __task_cred(ta=
sk);
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  278  	if (!uid_eq(tcred->uid, =
cred->euid) &&
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  279  	    !uid_eq(tcred->uid, =
cred->uid) && !capable(CAP_SYS_NICE)) {
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  280  		rcu_read_unlock();
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  281  		return -EPERM;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  282  	}
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  283  	rcu_read_unlock();
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  284  =

a411cd3cfdc5bb Christoph Hellwig 2021-12-09  285  	err =3D security_task_se=
tioprio(task, ioprio);
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  286  	if (err)
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  287  		return err;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  288  =

8472161b77c41d Christoph Hellwig 2021-12-09  289  	task_lock(task);
8472161b77c41d Christoph Hellwig 2021-12-09  290  	if (unlikely(!task->io_c=
ontext)) {
8472161b77c41d Christoph Hellwig 2021-12-09  291  		struct io_context *ioc;
8472161b77c41d Christoph Hellwig 2021-12-09  292  =

8472161b77c41d Christoph Hellwig 2021-12-09  293  		task_unlock(task);
5fc11eebb4a98d Christoph Hellwig 2021-12-09  294  =

5fc11eebb4a98d Christoph Hellwig 2021-12-09  295  		ioc =3D alloc_io_contex=
t(GFP_ATOMIC, NUMA_NO_NODE);
5fc11eebb4a98d Christoph Hellwig 2021-12-09  296  		if (!ioc)
5fc11eebb4a98d Christoph Hellwig 2021-12-09  297  			return -ENOMEM;
5fc11eebb4a98d Christoph Hellwig 2021-12-09  298  =

5fc11eebb4a98d Christoph Hellwig 2021-12-09  299  		task_lock(task);
5fc11eebb4a98d Christoph Hellwig 2021-12-09 @300  		if (task->io_context ||=
 (task->flags & PF_EXITING)) {
5fc11eebb4a98d Christoph Hellwig 2021-12-09  301  			kmem_cache_free(iocont=
ext_cachep, ioc);
5fc11eebb4a98d Christoph Hellwig 2021-12-09  302  			ioc =3D task->io_conte=
xt;
5fc11eebb4a98d Christoph Hellwig 2021-12-09  303  		} else {
5fc11eebb4a98d Christoph Hellwig 2021-12-09  304  			task->io_context =3D i=
oc;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  305  		}
8472161b77c41d Christoph Hellwig 2021-12-09  306  	}
8472161b77c41d Christoph Hellwig 2021-12-09 @307  	task->io_context->ioprio=
 =3D ioprio;
8472161b77c41d Christoph Hellwig 2021-12-09  308  	task_unlock(task);
8472161b77c41d Christoph Hellwig 2021-12-09  309  	return 0;
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  310  }
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  311  EXPORT_SYMBOL_GPL(set_tas=
k_ioprio);
a411cd3cfdc5bb Christoph Hellwig 2021-12-09  312  =


:::::: The code at line 307 was first introduced by commit
:::::: 8472161b77c41d260c5ba0af6bf940269b297bb6 block: fold get_task_io_con=
text into set_task_ioprio

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0756124997353326638==--


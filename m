Content-Type: multipart/mixed; boundary="===============1593972181006084119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:locking/ww_rt_mutex 18/18] kernel/locking/test-ww_rt_mutex.c:380:17: warning: Local variable stress shadows outer function [shadowFunction]
Date: Tue, 03 Aug 2021 05:27:08 +0800
Message-ID: <202108030556.048GbZb4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1593972181006084119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/ww_rt_mutex
head:   513277f3c78127286fd37a34f616801bdcc3aa60
commit: 513277f3c78127286fd37a34f616801bdcc3aa60 [18/18] locking/ww_mutex: =
test_ww_rt_mutex
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: aarch64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/locking/test-ww_rt_mutex.c:380:17: warning: Local variable stress=
 shadows outer function [shadowFunction]
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:524:12: note: Shadowed declaration
   static int stress(int nlocks, int nthreads, unsigned int flags)
              ^
   kernel/locking/test-ww_rt_mutex.c:380:17: note: Shadow variable
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:439:17: warning: Local variable stress=
 shadows outer function [shadowFunction]
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:524:12: note: Shadowed declaration
   static int stress(int nlocks, int nthreads, unsigned int flags)
              ^
   kernel/locking/test-ww_rt_mutex.c:439:17: note: Shadow variable
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:499:17: warning: Local variable stress=
 shadows outer function [shadowFunction]
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:524:12: note: Shadowed declaration
   static int stress(int nlocks, int nthreads, unsigned int flags)
              ^
   kernel/locking/test-ww_rt_mutex.c:499:17: note: Shadow variable
    struct stress *stress =3D container_of(work, typeof(*stress), work);
                   ^
   kernel/locking/test-ww_rt_mutex.c:537:18: warning: Local variable stress=
 shadows outer function [shadowFunction]
     struct stress *stress;
                    ^
   kernel/locking/test-ww_rt_mutex.c:524:12: note: Shadowed declaration
   static int stress(int nlocks, int nthreads, unsigned int flags)
              ^
   kernel/locking/test-ww_rt_mutex.c:537:18: note: Shadow variable
     struct stress *stress;
                    ^

vim +380 kernel/locking/test-ww_rt_mutex.c

513277f3c78127 Peter Zijlstra 2021-07-16  377  =

513277f3c78127 Peter Zijlstra 2021-07-16  378  static void stress_inorder_w=
ork(struct work_struct *work)
513277f3c78127 Peter Zijlstra 2021-07-16  379  {
513277f3c78127 Peter Zijlstra 2021-07-16 @380  	struct stress *stress =3D c=
ontainer_of(work, typeof(*stress), work);
513277f3c78127 Peter Zijlstra 2021-07-16  381  	const int nlocks =3D stress=
->nlocks;
513277f3c78127 Peter Zijlstra 2021-07-16  382  	struct ww_rt_mutex *locks =
=3D stress->locks;
513277f3c78127 Peter Zijlstra 2021-07-16  383  	struct ww_acquire_ctx ctx;
513277f3c78127 Peter Zijlstra 2021-07-16  384  	int *order;
513277f3c78127 Peter Zijlstra 2021-07-16  385  =

513277f3c78127 Peter Zijlstra 2021-07-16  386  	order =3D get_random_order(=
nlocks);
513277f3c78127 Peter Zijlstra 2021-07-16  387  	if (!order)
513277f3c78127 Peter Zijlstra 2021-07-16  388  		return;
513277f3c78127 Peter Zijlstra 2021-07-16  389  =

513277f3c78127 Peter Zijlstra 2021-07-16  390  	do {
513277f3c78127 Peter Zijlstra 2021-07-16  391  		int contended =3D -1;
513277f3c78127 Peter Zijlstra 2021-07-16  392  		int n, err;
513277f3c78127 Peter Zijlstra 2021-07-16  393  =

513277f3c78127 Peter Zijlstra 2021-07-16  394  		ww_acquire_init(&ctx, &ww_=
class);
513277f3c78127 Peter Zijlstra 2021-07-16  395  retry:
513277f3c78127 Peter Zijlstra 2021-07-16  396  		err =3D 0;
513277f3c78127 Peter Zijlstra 2021-07-16  397  		for (n =3D 0; n < nlocks; =
n++) {
513277f3c78127 Peter Zijlstra 2021-07-16  398  			if (n =3D=3D contended)
513277f3c78127 Peter Zijlstra 2021-07-16  399  				continue;
513277f3c78127 Peter Zijlstra 2021-07-16  400  =

513277f3c78127 Peter Zijlstra 2021-07-16  401  			err =3D ww_rt_mutex_lock(=
&locks[order[n]], &ctx);
513277f3c78127 Peter Zijlstra 2021-07-16  402  			if (err < 0)
513277f3c78127 Peter Zijlstra 2021-07-16  403  				break;
513277f3c78127 Peter Zijlstra 2021-07-16  404  		}
513277f3c78127 Peter Zijlstra 2021-07-16  405  		if (!err)
513277f3c78127 Peter Zijlstra 2021-07-16  406  			dummy_load(stress);
513277f3c78127 Peter Zijlstra 2021-07-16  407  =

513277f3c78127 Peter Zijlstra 2021-07-16  408  		if (contended > n)
513277f3c78127 Peter Zijlstra 2021-07-16  409  			ww_rt_mutex_unlock(&locks=
[order[contended]]);
513277f3c78127 Peter Zijlstra 2021-07-16  410  		contended =3D n;
513277f3c78127 Peter Zijlstra 2021-07-16  411  		while (n--)
513277f3c78127 Peter Zijlstra 2021-07-16  412  			ww_rt_mutex_unlock(&locks=
[order[n]]);
513277f3c78127 Peter Zijlstra 2021-07-16  413  =

513277f3c78127 Peter Zijlstra 2021-07-16  414  		if (err =3D=3D -EDEADLK) {
513277f3c78127 Peter Zijlstra 2021-07-16  415  			ww_rt_mutex_lock_slow(&lo=
cks[order[contended]], &ctx);
513277f3c78127 Peter Zijlstra 2021-07-16  416  			goto retry;
513277f3c78127 Peter Zijlstra 2021-07-16  417  		}
513277f3c78127 Peter Zijlstra 2021-07-16  418  =

513277f3c78127 Peter Zijlstra 2021-07-16  419  		if (err) {
513277f3c78127 Peter Zijlstra 2021-07-16  420  			pr_err_once("stress (%s) =
failed with %d\n",
513277f3c78127 Peter Zijlstra 2021-07-16  421  				    __func__, err);
513277f3c78127 Peter Zijlstra 2021-07-16  422  			break;
513277f3c78127 Peter Zijlstra 2021-07-16  423  		}
513277f3c78127 Peter Zijlstra 2021-07-16  424  =

513277f3c78127 Peter Zijlstra 2021-07-16  425  		ww_acquire_fini(&ctx);
513277f3c78127 Peter Zijlstra 2021-07-16  426  	} while (!time_after(jiffie=
s, stress->timeout));
513277f3c78127 Peter Zijlstra 2021-07-16  427  =

513277f3c78127 Peter Zijlstra 2021-07-16  428  	kfree(order);
513277f3c78127 Peter Zijlstra 2021-07-16  429  	kfree(stress);
513277f3c78127 Peter Zijlstra 2021-07-16  430  }
513277f3c78127 Peter Zijlstra 2021-07-16  431  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1593972181006084119==--


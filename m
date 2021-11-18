Content-Type: multipart/mixed; boundary="===============3178222132223855682=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/futex/pi.c:1089 futex_lock_pi() warn: bitwise AND condition is false here
Date: Thu, 18 Nov 2021 14:30:18 +0800
Message-ID: <202111181415.zTpKiuvx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3178222132223855682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Andr=C3=A9 Almeida" <andrealmeid@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42eb8fdac2fc5d62392dcfcf0253753e821a97b0
commit: 85dc28fa4ec058645c29bda952d901b29dfaa0b0 futex: Split out PI futex
date:   6 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: m68k-randconfig-m031-20211117 (attached as .config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/futex/pi.c:1089 futex_lock_pi() warn: bitwise AND condition is false=
 here

vim +1089 kernel/futex/pi.c

85dc28fa4ec058 Peter Zijlstra 2021-09-23   920  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   921  /*
85dc28fa4ec058 Peter Zijlstra 2021-09-23   922   * Userspace tried a 0 -> T=
ID atomic transition of the futex value
85dc28fa4ec058 Peter Zijlstra 2021-09-23   923   * and failed. The kernel s=
ide here does the whole locking operation:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   924   * if there are waiters the=
n it will block as a consequence of relying
85dc28fa4ec058 Peter Zijlstra 2021-09-23   925   * on rt-mutexes, it does P=
I, etc. (Due to races the kernel might see
85dc28fa4ec058 Peter Zijlstra 2021-09-23   926   * a 0 value of the futex t=
oo.).
85dc28fa4ec058 Peter Zijlstra 2021-09-23   927   *
85dc28fa4ec058 Peter Zijlstra 2021-09-23   928   * Also serves as futex try=
lock_pi()'ing, and due semantics.
85dc28fa4ec058 Peter Zijlstra 2021-09-23   929   */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   930  int futex_lock_pi(u32 __use=
r *uaddr, unsigned int flags, ktime_t *time, int trylock)
85dc28fa4ec058 Peter Zijlstra 2021-09-23   931  {
85dc28fa4ec058 Peter Zijlstra 2021-09-23   932  	struct hrtimer_sleeper tim=
eout, *to;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   933  	struct task_struct *exitin=
g =3D NULL;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   934  	struct rt_mutex_waiter rt_=
waiter;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   935  	struct futex_hash_bucket *=
hb;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   936  	struct futex_q q =3D futex=
_q_init;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   937  	int res, ret;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   938  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   939  	if (!IS_ENABLED(CONFIG_FUT=
EX_PI))
85dc28fa4ec058 Peter Zijlstra 2021-09-23   940  		return -ENOSYS;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   941  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   942  	if (refill_pi_state_cache(=
))
85dc28fa4ec058 Peter Zijlstra 2021-09-23   943  		return -ENOMEM;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   944  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   945  	to =3D futex_setup_timer(t=
ime, &timeout, flags, 0);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   946  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   947  retry:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   948  	ret =3D get_futex_key(uadd=
r, flags & FLAGS_SHARED, &q.key, FUTEX_WRITE);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   949  	if (unlikely(ret !=3D 0))
85dc28fa4ec058 Peter Zijlstra 2021-09-23   950  		goto out;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   951  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   952  retry_private:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   953  	hb =3D futex_q_lock(&q);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   954  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   955  	ret =3D futex_lock_pi_atom=
ic(uaddr, hb, &q.key, &q.pi_state, current,
85dc28fa4ec058 Peter Zijlstra 2021-09-23   956  				   &exiting, 0);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   957  	if (unlikely(ret)) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23   958  		/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23   959  		 * Atomic work succeeded =
and we got the lock,
85dc28fa4ec058 Peter Zijlstra 2021-09-23   960  		 * or failed. Either way,=
 we do _not_ block.
85dc28fa4ec058 Peter Zijlstra 2021-09-23   961  		 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   962  		switch (ret) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23   963  		case 1:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   964  			/* We got the lock. */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   965  			ret =3D 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   966  			goto out_unlock_put_key;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   967  		case -EFAULT:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   968  			goto uaddr_faulted;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   969  		case -EBUSY:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   970  		case -EAGAIN:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   971  			/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23   972  			 * Two reasons for this:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   973  			 * - EBUSY: Task is exit=
ing and we just wait for the
85dc28fa4ec058 Peter Zijlstra 2021-09-23   974  			 *   exit to complete.
85dc28fa4ec058 Peter Zijlstra 2021-09-23   975  			 * - EAGAIN: The user sp=
ace value changed.
85dc28fa4ec058 Peter Zijlstra 2021-09-23   976  			 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   977  			futex_q_unlock(hb);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   978  			/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23   979  			 * Handle the case where=
 the owner is in the middle of
85dc28fa4ec058 Peter Zijlstra 2021-09-23   980  			 * exiting. Wait for the=
 exit to complete otherwise
85dc28fa4ec058 Peter Zijlstra 2021-09-23   981  			 * this task might loop =
forever, aka. live lock.
85dc28fa4ec058 Peter Zijlstra 2021-09-23   982  			 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   983  			wait_for_owner_exiting(r=
et, exiting);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   984  			cond_resched();
85dc28fa4ec058 Peter Zijlstra 2021-09-23   985  			goto retry;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   986  		default:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   987  			goto out_unlock_put_key;
85dc28fa4ec058 Peter Zijlstra 2021-09-23   988  		}
85dc28fa4ec058 Peter Zijlstra 2021-09-23   989  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23   990  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   991  	WARN_ON(!q.pi_state);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   992  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   993  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23   994  	 * Only actually queue now=
 that the atomic ops are done:
85dc28fa4ec058 Peter Zijlstra 2021-09-23   995  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23   996  	__futex_queue(&q, hb);
85dc28fa4ec058 Peter Zijlstra 2021-09-23   997  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23   998  	if (trylock) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23   999  		ret =3D rt_mutex_futex_tr=
ylock(&q.pi_state->pi_mutex);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1000  		/* Fixup the trylock retu=
rn value: */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1001  		ret =3D ret ? 0 : -EWOULD=
BLOCK;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1002  		goto no_block;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1003  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1004  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1005  	rt_mutex_init_waiter(&rt_w=
aiter);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1006  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1007  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1008  	 * On PREEMPT_RT_FULL, whe=
n hb->lock becomes an rt_mutex, we must not
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1009  	 * hold it while doing rt_=
mutex_start_proxy(), because then it will
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1010  	 * include hb->lock in the=
 blocking chain, even through we'll not in
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1011  	 * fact hold it while bloc=
king. This will lead it to report -EDEADLK
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1012  	 * and BUG when futex_unlo=
ck_pi() interleaves with this.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1013  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1014  	 * Therefore acquire wait_=
lock while holding hb->lock, but drop the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1015  	 * latter before calling _=
_rt_mutex_start_proxy_lock(). This
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1016  	 * interleaves with futex_=
unlock_pi() -- which does a similar lock
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1017  	 * handoff -- such that th=
e latter can observe the futex_q::pi_state
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1018  	 * before __rt_mutex_start=
_proxy_lock() is done.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1019  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1020  	raw_spin_lock_irq(&q.pi_st=
ate->pi_mutex.wait_lock);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1021  	spin_unlock(q.lock_ptr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1022  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1023  	 * __rt_mutex_start_proxy_=
lock() unconditionally enqueues the @rt_waiter
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1024  	 * such that futex_unlock_=
pi() is guaranteed to observe the waiter when
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1025  	 * it sees the futex_q::pi=
_state.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1026  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1027  	ret =3D __rt_mutex_start_p=
roxy_lock(&q.pi_state->pi_mutex, &rt_waiter, current);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1028  	raw_spin_unlock_irq(&q.pi_=
state->pi_mutex.wait_lock);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1029  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1030  	if (ret) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1031  		if (ret =3D=3D 1)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1032  			ret =3D 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1033  		goto cleanup;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1034  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1035  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1036  	if (unlikely(to))
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1037  		hrtimer_sleeper_start_exp=
ires(to, HRTIMER_MODE_ABS);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1038  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1039  	ret =3D rt_mutex_wait_prox=
y_lock(&q.pi_state->pi_mutex, to, &rt_waiter);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1040  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1041  cleanup:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1042  	spin_lock(q.lock_ptr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1043  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1044  	 * If we failed to acquire=
 the lock (deadlock/signal/timeout), we must
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1045  	 * first acquire the hb->l=
ock before removing the lock from the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1046  	 * rt_mutex waitqueue, suc=
h that we can keep the hb and rt_mutex wait
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1047  	 * lists consistent.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1048  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1049  	 * In particular; it is im=
portant that futex_unlock_pi() can not
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1050  	 * observe this inconsiste=
ncy.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1051  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1052  	if (ret && !rt_mutex_clean=
up_proxy_lock(&q.pi_state->pi_mutex, &rt_waiter))
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1053  		ret =3D 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1054  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1055  no_block:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1056  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1057  	 * Fixup the pi_state owne=
r and possibly acquire the lock if we
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1058  	 * haven't already.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1059  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1060  	res =3D fixup_pi_owner(uad=
dr, &q, !ret);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1061  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1062  	 * If fixup_pi_owner() ret=
urned an error, propagate that.  If it acquired
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1063  	 * the lock, clear our -ET=
IMEDOUT or -EINTR.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1064  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1065  	if (res)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1066  		ret =3D (res < 0) ? res :=
 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1067  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1068  	futex_unqueue_pi(&q);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1069  	spin_unlock(q.lock_ptr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1070  	goto out;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1071  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1072  out_unlock_put_key:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1073  	futex_q_unlock(hb);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1074  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1075  out:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1076  	if (to) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1077  		hrtimer_cancel(&to->timer=
);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1078  		destroy_hrtimer_on_stack(=
&to->timer);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1079  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1080  	return ret !=3D -EINTR ? r=
et : -ERESTARTNOINTR;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1081  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1082  uaddr_faulted:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1083  	futex_q_unlock(hb);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1084  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1085  	ret =3D fault_in_user_writ=
eable(uaddr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1086  	if (ret)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1087  		goto out;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1088  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23 @1089  	if (!(flags & FLAGS_SHARED=
))
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1090  		goto retry_private;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1091  =

85dc28fa4ec058 Peter Zijlstra 2021-09-23  1092  	goto retry;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1093  }
85dc28fa4ec058 Peter Zijlstra 2021-09-23  1094  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3178222132223855682==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3178222132223855682==--


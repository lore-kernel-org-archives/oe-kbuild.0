Content-Type: multipart/mixed; boundary="===============0721211232495181482=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/android/binder.c:3540 binder_thread_write() warn: overwrite may leak 'death'
Date: Thu, 22 Apr 2021 12:12:48 +0800
Message-ID: <202104221225.xs2Pjqjy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0721211232495181482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   16fc44d6387e260f4932e9248b985837324705d8
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20210421 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/android/binder.c:3540 binder_thread_write() warn: overwrite may lea=
k 'death'

vim +/death +3540 drivers/android/binder.c

44d8047f1d87ad drivers/android/binder.c         Todd Kjos              2018=
-08-28  3188  =

fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013=
-09-02  3189  static int binder_thread_write(struct binder_proc *proc,
fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013=
-09-02  3190  			struct binder_thread *thread,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3191  			binder_uintptr_t binder_buffer, size_t size,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3192  			binder_size_t *consumed)
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3193  {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3194  	uint32_t cmd;
342e5c90b60134 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3195  	struct binder_context *context =3D proc->context;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3196  	void __user *buffer =3D (void __user *)(uintptr_t)=
binder_buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3197  	void __user *ptr =3D buffer + *consumed;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3198  	void __user *end =3D buffer + size;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3199  =

26549d17741035 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3200  	while (ptr < end && thread->return_error.cmd =3D=3D BR_OK) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3201  		int ret;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3202  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3203  		if (get_user(cmd, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3204  			return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3205  		ptr +=3D sizeof(uint32_t);
975a1ac9a9fe65 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2012-10-16  3206  		trace_binder_command(cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3207  		if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.bc)) {
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017=
-06-29  3208  			atomic_inc(&binder_stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017=
-06-29  3209  			atomic_inc(&proc->stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017=
-06-29  3210  			atomic_inc(&thread->stats.bc[_IOC_NR(cmd)]);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3211  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3212  		switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3213  		case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3214  		case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3215  		case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3216  		case BC_DECREFS: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3217  			uint32_t target;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3218  			const char *debug_string;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3219  			bool strong =3D cmd =3D=3D BC_ACQUIRE || cmd =3D=3D BC_REL=
EASE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3220  			bool increment =3D cmd =3D=3D BC_INCREFS || cmd =3D=3D BC_=
ACQUIRE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3221  			struct binder_ref_data rdata;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3222  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3223  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3224  				return -EFAULT;
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3225  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3226  			ptr +=3D sizeof(uint32_t);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3227  			ret =3D -1;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3228  			if (increment && !target) {
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3229  				struct binder_node *ctx_mgr_node;
6c20032c22d982 drivers/android/binder.c         Andrew Bridges         2020=
-10-27  3230  =

c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3231  				mutex_lock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3232  				ctx_mgr_node =3D context->binder_context_mgr_node;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3233  				if (ctx_mgr_node) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3234  					if (ctx_mgr_node->proc =3D=3D proc) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3235  						binder_user_error("%d:%d context manager tried to acqui=
re desc 0\n",
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3236  								  proc->pid, thread->pid);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3237  						mutex_unlock(&context->context_mgr_node_lock);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3238  						return -EINVAL;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3239  					}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3240  					ret =3D binder_inc_ref_for_node(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3241  							proc, ctx_mgr_node,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3242  							strong, NULL, &rdata);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020=
-07-27  3243  				}
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3244  				mutex_unlock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3245  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3246  			if (ret)
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3247  				ret =3D binder_update_ref_for_handle(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3248  						proc, target, increment, strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3249  						&rdata);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3250  			if (!ret && rdata.desc !=3D target) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3251  				binder_user_error("%d:%d tried to acquire reference to de=
sc %d, got %d instead\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3252  					proc->pid, thread->pid,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3253  					target, rdata.desc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3254  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3255  			switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3256  			case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3257  				debug_string =3D "IncRefs";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3258  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3259  			case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3260  				debug_string =3D "Acquire";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3261  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3262  			case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3263  				debug_string =3D "Release";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3264  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3265  			case BC_DECREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3266  			default:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3267  				debug_string =3D "DecRefs";
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3268  				break;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3269  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3270  			if (ret) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3271  				binder_user_error("%d:%d %s %d refcount change on invalid=
 ref %d ret %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3272  					proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3273  					strong, target, ret);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3274  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3275  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3276  			binder_debug(BINDER_DEBUG_USER_REFS,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3277  				     "%d:%d %s ref %d desc %d s %d w %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3278  				     proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3279  				     rdata.debug_id, rdata.desc, rdata.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3280  				     rdata.weak);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3281  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3282  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3283  		case BC_INCREFS_DONE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3284  		case BC_ACQUIRE_DONE: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3285  			binder_uintptr_t node_ptr;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3286  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3287  			struct binder_node *node;
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3288  			bool free_node;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3289  =

da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3290  			if (get_user(node_ptr, (binder_uintptr_t __user =
*)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3291  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3292  			ptr +=3D sizeof(binder_uintptr_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3293  			if (get_user(cookie, (binder_uintptr_t __user *)=
ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3294  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3295  			ptr +=3D sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3296  			node =3D binder_get_node(proc, node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3297  			if (node =3D=3D NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3298  				binder_user_error("%d:%d %s u%016llx no match\n=
",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3299  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3300  					cmd =3D=3D BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3301  					"BC_INCREFS_DONE" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3302  					"BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3303  					(u64)node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3304  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3305  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3306  			if (cookie !=3D node->cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3307  				binder_user_error("%d:%d %s u%016llx node %d co=
okie mismatch %016llx !=3D %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3308  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3309  					cmd =3D=3D BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3310  					"BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3311  					(u64)node_ptr, node->debug_id,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3312  					(u64)cookie, (u64)node->cookie);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3313  				binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3314  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3315  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3316  			binder_node_inner_lock(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3317  			if (cmd =3D=3D BC_ACQUIRE_DONE) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3318  				if (node->pending_strong_ref =3D=3D 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3319  					binder_user_error("%d:%d BC_ACQUIRE_DONE node %d has no =
pending acquire request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3320  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3321  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3322  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3323  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3324  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3325  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3326  				node->pending_strong_ref =3D 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3327  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3328  				if (node->pending_weak_ref =3D=3D 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3329  					binder_user_error("%d:%d BC_INCREFS_DONE node %d has no =
pending increfs request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3330  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3331  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3332  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3333  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3334  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3335  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3336  				node->pending_weak_ref =3D 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3337  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3338  			free_node =3D binder_dec_node_nilocked(node,
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3339  					cmd =3D=3D BC_ACQUIRE_DONE, 0);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3340  			WARN_ON(free_node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3341  			binder_debug(BINDER_DEBUG_USER_REFS,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3342  				     "%d:%d %s node %d ls %d lw %d tr %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3343  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3344  				     cmd =3D=3D BC_INCREFS_DONE ? "BC_INCREFS_DONE" : "BC=
_ACQUIRE_DONE",
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3345  				     node->debug_id, node->local_strong_refs,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3346  				     node->local_weak_refs, node->tmp_refs);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3347  			binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3348  			binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3349  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3350  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3351  		case BC_ATTEMPT_ACQUIRE:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3352  			pr_err("BC_ATTEMPT_ACQUIRE not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3353  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3354  		case BC_ACQUIRE_RESULT:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3355  			pr_err("BC_ACQUIRE_RESULT not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3356  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3357  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3358  		case BC_FREE_BUFFER: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3359  			binder_uintptr_t data_ptr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3360  			struct binder_buffer *buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3361  =

da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3362  			if (get_user(data_ptr, (binder_uintptr_t __user =
*)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3363  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3364  			ptr +=3D sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3365  =

53d311cfa19ad3 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3366  			buffer =3D binder_alloc_prepare_to_free(&proc->alloc,
19c987241ca121 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3367  							      data_ptr);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3368  			if (IS_ERR_OR_NULL(buffer)) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3369  				if (PTR_ERR(buffer) =3D=3D -EPERM) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3370  					binder_user_error(
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3371  						"%d:%d BC_FREE_BUFFER u%016llx matched unreturned or cu=
rrently freeing buffer\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3372  						proc->pid, thread->pid,
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3373  						(u64)data_ptr);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3374  				} else {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3375  					binder_user_error(
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3376  						"%d:%d BC_FREE_BUFFER u%016llx no match\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3377  						proc->pid, thread->pid,
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018=
-11-06  3378  						(u64)data_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3379  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3380  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3381  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3382  			binder_debug(BINDER_DEBUG_FREE_BUFFER,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3383  				     "%d:%d BC_FREE_BUFFER u%016llx found buffe=
r %d for %s transaction\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3384  				     proc->pid, thread->pid, (u64)data_ptr,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3385  				     buffer->debug_id,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3386  				     buffer->transaction ? "active" : "finished");
44d8047f1d87ad drivers/android/binder.c         Todd Kjos              2018=
-08-28  3387  			binder_free_buf(proc, buffer);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3388  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3389  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3390  =

7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3391  		case BC_TRANSACTION_SG:
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3392  		case BC_REPLY_SG: {
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3393  			struct binder_transaction_data_sg tr;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3394  =

7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3395  			if (copy_from_user(&tr, ptr, sizeof(tr)))
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3396  				return -EFAULT;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3397  			ptr +=3D sizeof(tr);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3398  			binder_transaction(proc, thread, &tr.transaction_data,
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3399  					   cmd =3D=3D BC_REPLY_SG, tr.buffers_size);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3400  			break;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3401  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3402  		case BC_TRANSACTION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3403  		case BC_REPLY: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3404  			struct binder_transaction_data tr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3405  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3406  			if (copy_from_user(&tr, ptr, sizeof(tr)))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3407  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3408  			ptr +=3D sizeof(tr);
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3409  			binder_transaction(proc, thread, &tr,
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017=
-02-03  3410  					   cmd =3D=3D BC_REPLY, 0);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3411  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3412  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3413  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3414  		case BC_REGISTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3415  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3416  				     "%d:%d BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3417  				     proc->pid, thread->pid);
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3418  			binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3419  			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3420  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3421  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called=
 after BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3422  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3423  			} else if (proc->requested_threads =3D=3D 0) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3424  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3425  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called=
 without request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3426  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3427  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3428  				proc->requested_threads--;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3429  				proc->requested_threads_started++;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3430  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3431  			thread->looper |=3D BINDER_LOOPER_STATE_REGISTERED;
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3432  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3433  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3434  		case BC_ENTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3435  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3436  				     "%d:%d BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3437  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3438  			if (thread->looper & BINDER_LOOPER_STATE_REGISTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3439  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3440  				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called af=
ter BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3441  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3442  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3443  			thread->looper |=3D BINDER_LOOPER_STATE_ENTERED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3444  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3445  		case BC_EXIT_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3446  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3447  				     "%d:%d BC_EXIT_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3448  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3449  			thread->looper |=3D BINDER_LOOPER_STATE_EXITED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3450  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3451  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3452  		case BC_REQUEST_DEATH_NOTIFICATION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3453  		case BC_CLEAR_DEATH_NOTIFICATION: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3454  			uint32_t target;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3455  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3456  			struct binder_ref *ref;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3457  			struct binder_ref_death *death =3D NULL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3458  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3459  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3460  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3461  			ptr +=3D sizeof(uint32_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3462  			if (get_user(cookie, (binder_uintptr_t __user *)=
ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3463  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3464  			ptr +=3D sizeof(binder_uintptr_t);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3465  			if (cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3466  				/*
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3467  				 * Allocate memory for death notification
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3468  				 * before taking lock
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3469  				 */
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3470  				death =3D kzalloc(sizeof(*death), GFP_KERNEL);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3471  				if (death =3D=3D NULL) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3472  					WARN_ON(thread->return_error.cmd !=3D
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3473  						BR_OK);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3474  					thread->return_error.cmd =3D BR_ERROR;
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3475  					binder_enqueue_thread_work(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3476  						thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3477  						&thread->return_error.work);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3478  					binder_debug(
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3479  						BINDER_DEBUG_FAILED_TRANSACTION,
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3480  						"%d:%d BC_REQUEST_DEATH_NOTIFICATION failed\n",
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3481  						proc->pid, thread->pid);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3482  					break;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3483  				}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3484  			}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3485  			binder_proc_lock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3486  			ref =3D binder_get_ref_olocked(proc, target, false);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3487  			if (ref =3D=3D NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3488  				binder_user_error("%d:%d %s invalid ref %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3489  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3490  					cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3491  					"BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3492  					"BC_CLEAR_DEATH_NOTIFICATION",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3493  					target);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3494  				binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3495  				kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3496  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3497  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3498  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3499  			binder_debug(BINDER_DEBUG_DEATH_NOTIFICATION,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3500  				     "%d:%d %s %016llx ref %d desc %d s %d w %d=
 for node %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3501  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3502  				     cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3503  				     "BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3504  				     "BC_CLEAR_DEATH_NOTIFICATION",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3505  				     (u64)cookie, ref->data.debug_id,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3506  				     ref->data.desc, ref->data.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3507  				     ref->data.weak, ref->node->debug_id);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3508  =

ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017=
-06-29  3509  			binder_node_lock(ref->node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3510  			if (cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3511  				if (ref->death) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3512  					binder_user_error("%d:%d BC_REQUEST_DEATH_NOTIFICATION d=
eath notification already set\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3513  						proc->pid, thread->pid);
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017=
-06-29  3514  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3515  					binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3516  					kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3517  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3518  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3519  				binder_stats_created(BINDER_STAT_DEATH);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3520  				INIT_LIST_HEAD(&death->work.entry);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3521  				death->cookie =3D cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3522  				ref->death =3D death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3523  				if (ref->node->proc =3D=3D NULL) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3524  					ref->death->work.type =3D BINDER_WORK_DEAD_BINDER;
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3525  =

1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3526  					binder_inner_proc_lock(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3527  					binder_enqueue_work_ilocked(
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3528  						&ref->death->work, &proc->todo);
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3529  					binder_wakeup_proc_ilocked(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3530  					binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3531  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3532  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3533  				if (ref->death =3D=3D NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3534  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION dea=
th notification not active\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3535  						proc->pid, thread->pid);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3536  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3537  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3538  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3539  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30 @3540  				death =3D ref->death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3541  				if (death->cookie !=3D cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3542  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFI=
CATION death notification cookie mismatch %016llx !=3D %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3543  						proc->pid, thread->pid,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3544  						(u64)death->cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3545  						(u64)cookie);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017=
-06-29  3546  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3547  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3548  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3549  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3550  				ref->death =3D NULL;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3551  				binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3552  				if (list_empty(&death->work.entry)) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3553  					death->work.type =3D BINDER_WORK_CLEAR_DEATH_NOTIFICATIO=
N;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3554  					if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3555  					    (BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3556  					     BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3557  						binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3558  								thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3559  								&death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3560  					else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3561  						binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3562  								&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3563  								&proc->todo);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3564  						binder_wakeup_proc_ilocked(
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3565  								proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3566  					}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3567  				} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3568  					BUG_ON(death->work.type !=3D BINDER_WORK_DEAD_BINDER);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3569  					death->work.type =3D BINDER_WORK_DEAD_BINDER_AND_CLEAR;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3570  				}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3571  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3572  			}
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017=
-06-29  3573  			binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017=
-06-29  3574  			binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3575  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3576  		case BC_DEAD_BINDER_DONE: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3577  			struct binder_work *w;
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3578  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3579  			struct binder_ref_death *death =3D NULL;
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014=
-05-01  3580  =

da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3581  			if (get_user(cookie, (binder_uintptr_t __user *)=
ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3582  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3583  =

7a64cd887fdb97 drivers/android/binder.c         Lisa Du                2016=
-02-17  3584  			ptr +=3D sizeof(cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3585  			binder_inner_proc_lock(proc);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3586  			list_for_each_entry(w, &proc->delivered_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3587  					    entry) {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3588  				struct binder_ref_death *tmp_death =3D
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3589  					container_of(w,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3590  						     struct binder_ref_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3591  						     work);
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014=
-05-01  3592  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3593  				if (tmp_death->cookie =3D=3D cookie) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3594  					death =3D tmp_death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3595  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3596  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3597  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3598  			binder_debug(BINDER_DEBUG_DEAD_BINDER,
8ca86f1639ec58 drivers/android/binder.c         Todd Kjos              2018=
-02-07  3599  				     "%d:%d BC_DEAD_BINDER_DONE %016llx found %pK\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3600  				     proc->pid, thread->pid, (u64)cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3601  				     death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3602  			if (death =3D=3D NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3603  				binder_user_error("%d:%d BC_DEAD_BINDER_DONE %0=
16llx not found\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g   =
      2014-02-21  3604  					proc->pid, thread->pid, (u64)cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3605  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3606  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3607  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3608  			binder_dequeue_work_ilocked(&death->work);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3609  			if (death->work.type =3D=3D BINDER_WORK_DEAD_BINDER_AND_CL=
EAR) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3610  				death->work.type =3D BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3611  				if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3612  					(BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3613  					 BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3614  					binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017=
-11-15  3615  						thread, &death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3616  				else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3617  					binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3618  							&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3619  							&proc->todo);
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017=
-08-31  3620  					binder_wakeup_proc_ilocked(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3621  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3622  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017=
-06-29  3623  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3624  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3625  =

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3626  		default:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012=
-10-30  3627  			pr_err("%d:%d unknown command %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3628  			       proc->pid, thread->pid, cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3629  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3630  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3631  		*consumed =3D ptr - buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3632  	}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3633  	return 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3634  }
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011=
-11-30  3635  =


:::::: The code at line 3540 was first introduced by commit
:::::: 355b0502f6efea0ff9492753888772c96972d2a3 Revert "Staging: android: d=
elete android drivers"

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0721211232495181482==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AG6amwIA
--===============0721211232495181482==--


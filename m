Content-Type: multipart/mixed; boundary="===============6922285791141833323=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [brauner:pidfd_capabilities 5/7] kernel/fork.c:2388 copy_process() warn: passing zero to 'ERR_PTR'
Date: Mon, 27 Jan 2020 21:14:39 +0300
Message-ID: <20200127181439.GN1870@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6922285791141833323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git p=
idfd_capabilities
head:   39f8e5a5a89ad52ff07fd5af7e514def2b527ed5
commit: f661df61f0498a3bffb2ff4549d5515e94a05735 [5/7] pidfd: introduce and=
 port to pidfd_struct

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/fork.c:2388 copy_process() warn: passing zero to 'ERR_PTR'
kernel/fork.c:2388 copy_process() warn: inconsistent returns 'irq'.

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3Df661df61f0498a3bffb2ff4549d5515e94a05735
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout f661df61f0498a3bffb2ff4549d5515e94a05735
vim +/ERR_PTR +2388 kernel/fork.c

3c90e6e99b08f0 Srivatsa Vaddagiri        2007-11-09  2069  	/* Perform sche=
duler related setup. Assign this task to a CPU. */
aab03e05e8f7e2 Dario Faggioli            2013-11-28  2070  	retval =3D sche=
d_fork(clone_flags, p);
aab03e05e8f7e2 Dario Faggioli            2013-11-28  2071  	if (retval)
aab03e05e8f7e2 Dario Faggioli            2013-11-28  2072  		goto bad_fork_=
cleanup_policy;
6ab423e0eaca82 Peter Zijlstra            2009-05-25  2073  =

cdd6c482c9ff9c Ingo Molnar               2009-09-21  2074  	retval =3D perf=
_event_init_task(p);
6ab423e0eaca82 Peter Zijlstra            2009-05-25  2075  	if (retval)
6ab423e0eaca82 Peter Zijlstra            2009-05-25  2076  		goto bad_fork_=
cleanup_policy;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2077  	retval =3D audi=
t_alloc(p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2078  	if (retval)
6c72e3501d0d62 Peter Zijlstra            2014-10-02  2079  		goto bad_fork_=
cleanup_perf;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2080  	/* copy all the=
 process information */
ab602f79915939 Jack Miller               2014-08-08  2081  	shm_init_task(p=
);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2082  	retval =3D secu=
rity_task_alloc(p, clone_flags);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2083  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2084  		goto bad_fork_=
cleanup_audit;
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2085  	retval =3D copy=
_semundo(clone_flags, p);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2086  	if (retval)
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2087  		goto bad_fork_=
cleanup_security;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2088  	retval =3D copy=
_files(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2089  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2090  		goto bad_fork_=
cleanup_semundo;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2091  	retval =3D copy=
_fs(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2092  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2093  		goto bad_fork_=
cleanup_files;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2094  	retval =3D copy=
_sighand(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2095  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2096  		goto bad_fork_=
cleanup_fs;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2097  	retval =3D copy=
_signal(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2098  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2099  		goto bad_fork_=
cleanup_sighand;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2100  	retval =3D copy=
_mm(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2101  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2102  		goto bad_fork_=
cleanup_signal;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2103  	retval =3D copy=
_namespaces(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2104  	if (retval)
d84f4f992cbd76 David Howells             2008-11-14  2105  		goto bad_fork_=
cleanup_mm;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2106  	retval =3D copy=
_io(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2107  	if (retval)
fd0928df98b957 Jens Axboe                2008-01-24  2108  		goto bad_fork_=
cleanup_namespaces;
7f192e3cd316ba Christian Brauner         2019-05-25  2109  	retval =3D copy=
_thread_tls(clone_flags, args->stack, args->stack_size, p,
7f192e3cd316ba Christian Brauner         2019-05-25  2110  				 args->tls);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2111  	if (retval)
fd0928df98b957 Jens Axboe                2008-01-24  2112  		goto bad_fork_=
cleanup_io;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2113  =

afaef01c001537 Alexander Popov           2018-08-17  2114  	stackleak_task_=
init(p);
afaef01c001537 Alexander Popov           2018-08-17  2115  =

425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2116  	if (pid !=3D &i=
nit_struct_pid) {
49cb2fc42ce4b7 Adrian Reber              2019-11-15  2117  		pid =3D alloc_=
pid(p->nsproxy->pid_ns_for_children, args->set_tid,
49cb2fc42ce4b7 Adrian Reber              2019-11-15  2118  				args->set_ti=
d_size);
35f71bc0a09a45 Michal Hocko              2015-04-16  2119  		if (IS_ERR(pid=
)) {
35f71bc0a09a45 Michal Hocko              2015-04-16  2120  			retval =3D PT=
R_ERR(pid);
0740aa5f637568 Jiri Slaby                2016-05-20  2121  			goto bad_fork=
_cleanup_thread;
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2122  		}
35f71bc0a09a45 Michal Hocko              2015-04-16  2123  	}
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2124  =

b3e5838252665e Christian Brauner         2019-03-27  2125  	/*
b3e5838252665e Christian Brauner         2019-03-27  2126  	 * This has to =
happen after we've potentially unshared the file
b3e5838252665e Christian Brauner         2019-03-27  2127  	 * descriptor t=
able (so that the pidfd doesn't leak into the child
b3e5838252665e Christian Brauner         2019-03-27  2128  	 * if the fd ta=
ble isn't shared).
b3e5838252665e Christian Brauner         2019-03-27  2129  	 */
b3e5838252665e Christian Brauner         2019-03-27  2130  	if (clone_flags=
 & CLONE_PIDFD) {
f661df61f0498a Christian Brauner         2020-01-13  2131  		struct pidfd_s=
truct *pidfd_struct;
f661df61f0498a Christian Brauner         2020-01-13  2132  =

f661df61f0498a Christian Brauner         2020-01-13  2133  		pidfd_struct =
=3D pidfd_alloc(pid);
f661df61f0498a Christian Brauner         2020-01-13  2134  		if (IS_ERR(pid=
fd_struct))
f661df61f0498a Christian Brauner         2020-01-13  2135  			goto bad_fork=
_free_pid;
                                                                           =
     ^^^^^^^^^^^^^^^^^^^^^^
retval not set.


f661df61f0498a Christian Brauner         2020-01-13  2136  =

6fd2fe494b17bf Al Viro                   2019-06-26  2137  		retval =3D get=
_unused_fd_flags(O_RDWR | O_CLOEXEC);
f661df61f0498a Christian Brauner         2020-01-13  2138  		if (retval < 0=
) {
f661df61f0498a Christian Brauner         2020-01-13  2139  			pidfd_put(pid=
fd_struct);
b3e5838252665e Christian Brauner         2019-03-27  2140  			goto bad_fork=
_free_pid;
f661df61f0498a Christian Brauner         2020-01-13  2141  		}
b3e5838252665e Christian Brauner         2019-03-27  2142  =

b3e5838252665e Christian Brauner         2019-03-27  2143  		pidfd =3D retv=
al;
6fd2fe494b17bf Al Viro                   2019-06-26  2144  =

f661df61f0498a Christian Brauner         2020-01-13  2145  		pidfile =3D an=
on_inode_getfile("[pidfd]", &pidfd_fops,
f661df61f0498a Christian Brauner         2020-01-13  2146  					     pidfd_=
struct, O_RDWR | O_CLOEXEC);
6fd2fe494b17bf Al Viro                   2019-06-26  2147  		if (IS_ERR(pid=
file)) {
6fd2fe494b17bf Al Viro                   2019-06-26  2148  			put_unused_fd=
(pidfd);
f661df61f0498a Christian Brauner         2020-01-13  2149  			pidfd_put(pid=
fd_struct);
28dd29c06d0ded Christian Brauner         2019-07-01  2150  			retval =3D PT=
R_ERR(pidfile);
6fd2fe494b17bf Al Viro                   2019-06-26  2151  			goto bad_fork=
_free_pid;
6fd2fe494b17bf Al Viro                   2019-06-26  2152  		}
6fd2fe494b17bf Al Viro                   2019-06-26  2153  =

7f192e3cd316ba Christian Brauner         2019-05-25  2154  		retval =3D put=
_user(pidfd, args->pidfd);
b3e5838252665e Christian Brauner         2019-03-27  2155  		if (retval)
b3e5838252665e Christian Brauner         2019-03-27  2156  			goto bad_fork=
_put_pidfd;
b3e5838252665e Christian Brauner         2019-03-27  2157  	}
b3e5838252665e Christian Brauner         2019-03-27  2158  =

73c101011926c5 Jens Axboe                2011-03-08  2159  #ifdef CONFIG_BL=
OCK
73c101011926c5 Jens Axboe                2011-03-08  2160  	p->plug =3D NUL=
L;
73c101011926c5 Jens Axboe                2011-03-08  2161  #endif
ba31c1a4853899 Thomas Gleixner           2019-11-06  2162  	futex_init_task=
(p);
ba31c1a4853899 Thomas Gleixner           2019-11-06  2163  =

f9a3879abf2f1a GOTO Masanori             2006-03-13  2164  	/*
f9a3879abf2f1a GOTO Masanori             2006-03-13  2165  	 * sigaltstack =
should be cleared when sharing the same VM
f9a3879abf2f1a GOTO Masanori             2006-03-13  2166  	 */
f9a3879abf2f1a GOTO Masanori             2006-03-13  2167  	if ((clone_flag=
s & (CLONE_VM|CLONE_VFORK)) =3D=3D CLONE_VM)
2a74213838104a Stas Sergeev              2016-04-14  2168  		sas_ss_reset(p=
);
f9a3879abf2f1a GOTO Masanori             2006-03-13  2169  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  2170  	/*
6580807da14c42 Oleg Nesterov             2009-12-15  2171  	 * Syscall trac=
ing and stepping should be turned off in the
6580807da14c42 Oleg Nesterov             2009-12-15  2172  	 * child regard=
less of CLONE_PTRACE.
^1da177e4c3f41 Linus Torvalds            2005-04-16  2173  	 */
6580807da14c42 Oleg Nesterov             2009-12-15  2174  	user_disable_si=
ngle_step(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2175  	clear_tsk_threa=
d_flag(p, TIF_SYSCALL_TRACE);
ed75e8d58010fd Laurent Vivier            2005-09-03  2176  #ifdef TIF_SYSCA=
LL_EMU
ed75e8d58010fd Laurent Vivier            2005-09-03  2177  	clear_tsk_threa=
d_flag(p, TIF_SYSCALL_EMU);
ed75e8d58010fd Laurent Vivier            2005-09-03  2178  #endif
e02c9b0d65a749 Lin Feng                  2019-05-14  2179  	clear_tsk_laten=
cy_tracing(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2180  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  2181  	/* ok, now we s=
hould be set up.. */
18c830df771f2b Oleg Nesterov             2013-07-03  2182  	p->pid =3D pid_=
nr(pid);
18c830df771f2b Oleg Nesterov             2013-07-03  2183  	if (clone_flags=
 & CLONE_THREAD) {
5f8aadd8b9966d Oleg Nesterov             2012-03-14  2184  		p->exit_signal=
 =3D -1;
18c830df771f2b Oleg Nesterov             2013-07-03  2185  		p->group_leade=
r =3D current->group_leader;
18c830df771f2b Oleg Nesterov             2013-07-03  2186  		p->tgid =3D cu=
rrent->tgid;
18c830df771f2b Oleg Nesterov             2013-07-03  2187  	} else {
18c830df771f2b Oleg Nesterov             2013-07-03  2188  		if (clone_flag=
s & CLONE_PARENT)
5f8aadd8b9966d Oleg Nesterov             2012-03-14  2189  			p->exit_signa=
l =3D current->group_leader->exit_signal;
5f8aadd8b9966d Oleg Nesterov             2012-03-14  2190  		else
7f192e3cd316ba Christian Brauner         2019-05-25  2191  			p->exit_signa=
l =3D args->exit_signal;
18c830df771f2b Oleg Nesterov             2013-07-03  2192  		p->group_leade=
r =3D p;
18c830df771f2b Oleg Nesterov             2013-07-03  2193  		p->tgid =3D p-=
>pid;
18c830df771f2b Oleg Nesterov             2013-07-03  2194  	}
5f8aadd8b9966d Oleg Nesterov             2012-03-14  2195  =

9d823e8f6b1b7b Wu Fengguang              2011-06-11  2196  	p->nr_dirtied =
=3D 0;
9d823e8f6b1b7b Wu Fengguang              2011-06-11  2197  	p->nr_dirtied_p=
ause =3D 128 >> (PAGE_SHIFT - 10);
83712358ba0a14 Wu Fengguang              2011-06-11  2198  	p->dirty_paused=
_when =3D 0;
9d823e8f6b1b7b Wu Fengguang              2011-06-11  2199  =

bb8cbbfee68518 Oleg Nesterov             2013-11-13  2200  	p->pdeath_signa=
l =3D 0;
47e65328a7b1cd Oleg Nesterov             2006-03-28  2201  	INIT_LIST_HEAD(=
&p->thread_group);
158e1645e07f3e Al Viro                   2012-06-27  2202  	p->task_works =
=3D NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2203  =

780de9dd2720de Ingo Molnar               2017-02-02  2204  	cgroup_threadgr=
oup_change_begin(current);
7e47682ea555e7 Aleksa Sarai              2015-06-09  2205  	/*
7e47682ea555e7 Aleksa Sarai              2015-06-09  2206  	 * Ensure that =
the cgroup subsystem policies allow the new process to be
7e47682ea555e7 Aleksa Sarai              2015-06-09  2207  	 * forked. It s=
hould be noted the the new process's css_set can be changed
7e47682ea555e7 Aleksa Sarai              2015-06-09  2208  	 * between here=
 and cgroup_post_fork() if an organisation operation is in
7e47682ea555e7 Aleksa Sarai              2015-06-09  2209  	 * progress.
7e47682ea555e7 Aleksa Sarai              2015-06-09  2210  	 */
b53202e6308939 Oleg Nesterov             2015-12-03  2211  	retval =3D cgro=
up_can_fork(p);
7e47682ea555e7 Aleksa Sarai              2015-06-09  2212  	if (retval)
c3b7112df86b76 Christian Brauner         2019-05-10  2213  		goto bad_fork_=
cgroup_threadgroup_change_end;
7e47682ea555e7 Aleksa Sarai              2015-06-09  2214  =

7b55851367136b David Herrmann            2019-01-08  2215  	/*
7b55851367136b David Herrmann            2019-01-08  2216  	 * From this po=
int on we must avoid any synchronous user-space
7b55851367136b David Herrmann            2019-01-08  2217  	 * communicatio=
n until we take the tasklist-lock. In particular, we do
7b55851367136b David Herrmann            2019-01-08  2218  	 * not want use=
r-space to be able to predict the process start-time by
7b55851367136b David Herrmann            2019-01-08  2219  	 * stalling for=
k(2) after we recorded the start_time but before it is
7b55851367136b David Herrmann            2019-01-08  2220  	 * visible to t=
he system.
7b55851367136b David Herrmann            2019-01-08  2221  	 */
7b55851367136b David Herrmann            2019-01-08  2222  =

7b55851367136b David Herrmann            2019-01-08  2223  	p->start_time =
=3D ktime_get_ns();
cf25e24db61cc9 Peter Zijlstra            2019-11-07  2224  	p->start_bootti=
me =3D ktime_get_boottime_ns();
7b55851367136b David Herrmann            2019-01-08  2225  =

18c830df771f2b Oleg Nesterov             2013-07-03  2226  	/*
18c830df771f2b Oleg Nesterov             2013-07-03  2227  	 * Make it visi=
ble to the rest of the system, but dont wake it up yet.
18c830df771f2b Oleg Nesterov             2013-07-03  2228  	 * Need tasklis=
t lock for parent etc handling!
18c830df771f2b Oleg Nesterov             2013-07-03  2229  	 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2230  	write_lock_irq(=
&tasklist_lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2231  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  2232  	/* CLONE_PARENT=
 re-uses the old parent */
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2233  	if (clone_flags=
 & (CLONE_PARENT|CLONE_THREAD)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2234  		p->real_parent=
 =3D current->real_parent;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2235  		p->parent_exec=
_id =3D current->parent_exec_id;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2236  	} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2237  		p->real_parent=
 =3D current;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2238  		p->parent_exec=
_id =3D current->self_exec_id;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2239  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2240  =

d83a7cb375eec2 Josh Poimboeuf            2017-02-13  2241  	klp_copy_proces=
s(p);
d83a7cb375eec2 Josh Poimboeuf            2017-02-13  2242  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  2243  	spin_lock(&curr=
ent->sighand->siglock);
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2244  =

dbd952127d11bb Kees Cook                 2014-06-27  2245  	/*
dbd952127d11bb Kees Cook                 2014-06-27  2246  	 * Copy seccomp=
 details explicitly here, in case they were changed
dbd952127d11bb Kees Cook                 2014-06-27  2247  	 * before holdi=
ng sighand lock.
dbd952127d11bb Kees Cook                 2014-06-27  2248  	 */
dbd952127d11bb Kees Cook                 2014-06-27  2249  	copy_seccomp(p);
dbd952127d11bb Kees Cook                 2014-06-27  2250  =

d7822b1e24f2df Mathieu Desnoyers         2018-06-02  2251  	rseq_fork(p, cl=
one_flags);
d7822b1e24f2df Mathieu Desnoyers         2018-06-02  2252  =

4ca1d3ee46130e Eric W. Biederman         2018-07-13  2253  	/* Don't start =
children in a dying pid namespace */
e8cfbc245e2488 Gargi Sharma              2017-11-17  2254  	if (unlikely(!(=
ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
3fd37226216620 Kirill Tkhai              2017-05-12  2255  		retval =3D -EN=
OMEM;
3fd37226216620 Kirill Tkhai              2017-05-12  2256  		goto bad_fork_=
cancel_cgroup;
3fd37226216620 Kirill Tkhai              2017-05-12  2257  	}
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2258  =

7673bf553b2732 Eric W. Biederman         2018-07-23  2259  	/* Let kill ter=
minate clone/fork in the middle */
7673bf553b2732 Eric W. Biederman         2018-07-23  2260  	if (fatal_signa=
l_pending(current)) {
7673bf553b2732 Eric W. Biederman         2018-07-23  2261  		retval =3D -EI=
NTR;
7673bf553b2732 Eric W. Biederman         2018-07-23  2262  		goto bad_fork_=
cancel_cgroup;
7673bf553b2732 Eric W. Biederman         2018-07-23  2263  	}
7673bf553b2732 Eric W. Biederman         2018-07-23  2264  =

6fd2fe494b17bf Al Viro                   2019-06-26  2265  	/* past the las=
t point of failure */
6fd2fe494b17bf Al Viro                   2019-06-26  2266  	if (pidfile)
6fd2fe494b17bf Al Viro                   2019-06-26  2267  		fd_install(pid=
fd, pidfile);
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2268  =

2c4704756cab7c Eric W. Biederman         2017-09-26  2269  	init_task_pid_l=
inks(p);
73b9ebfe126a4a Oleg Nesterov             2006-03-28  2270  	if (likely(p->p=
id)) {
4b9d33e6d83cc0 Tejun Heo                 2011-06-17  2271  		ptrace_init_ta=
sk(p, (clone_flags & CLONE_PTRACE) || trace);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2272  =

8190773985141f Oleg Nesterov             2013-07-03  2273  		init_task_pid(=
p, PIDTYPE_PID, pid);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2274  		if (thread_gro=
up_leader(p)) {
6883f81aac6f44 Eric W. Biederman         2017-06-04  2275  			init_task_pid=
(p, PIDTYPE_TGID, pid);
8190773985141f Oleg Nesterov             2013-07-03  2276  			init_task_pid=
(p, PIDTYPE_PGID, task_pgrp(current));
8190773985141f Oleg Nesterov             2013-07-03  2277  			init_task_pid=
(p, PIDTYPE_SID, task_session(current));
8190773985141f Oleg Nesterov             2013-07-03  2278  =

1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2279  			if (is_child_=
reaper(pid)) {
17cf22c33e1f1b Eric W. Biederman         2010-03-02  2280  				ns_of_pid(pi=
d)->child_reaper =3D p;
1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2281  				p->signal->f=
lags |=3D SIGNAL_UNKILLABLE;
1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2282  			}
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2283  			p->signal->sh=
ared_pending.signal =3D delayed.signal;
9c9f4ded90a59e Alan Cox                  2008-10-13  2284  			p->signal->tt=
y =3D tty_kref_get(current->signal->tty);
749860ce242798 Pavel Tikhomirov          2017-01-30  2285  			/*
749860ce242798 Pavel Tikhomirov          2017-01-30  2286  			 * Inherit ha=
s_child_subreaper flag under the same
749860ce242798 Pavel Tikhomirov          2017-01-30  2287  			 * tasklist_l=
ock with adding child to the process tree
749860ce242798 Pavel Tikhomirov          2017-01-30  2288  			 * for propag=
ate_has_child_subreaper optimization.
749860ce242798 Pavel Tikhomirov          2017-01-30  2289  			 */
749860ce242798 Pavel Tikhomirov          2017-01-30  2290  			p->signal->ha=
s_child_subreaper =3D p->real_parent->signal->has_child_subreaper ||
749860ce242798 Pavel Tikhomirov          2017-01-30  2291  							 p->real_=
parent->signal->is_child_subreaper;
9cd80bbb07fcd6 Oleg Nesterov             2009-12-17  2292  			list_add_tail=
(&p->sibling, &p->real_parent->children);
5e85d4abe3f43b Eric W. Biederman         2006-04-18  2293  			list_add_tail=
_rcu(&p->tasks, &init_task.tasks);
6883f81aac6f44 Eric W. Biederman         2017-06-04  2294  			attach_pid(p,=
 PIDTYPE_TGID);
8190773985141f Oleg Nesterov             2013-07-03  2295  			attach_pid(p,=
 PIDTYPE_PGID);
8190773985141f Oleg Nesterov             2013-07-03  2296  			attach_pid(p,=
 PIDTYPE_SID);
909ea96468096b Christoph Lameter         2010-12-08  2297  			__this_cpu_in=
c(process_counts);
80628ca06c5d42 Oleg Nesterov             2013-07-03  2298  		} else {
80628ca06c5d42 Oleg Nesterov             2013-07-03  2299  			current->sign=
al->nr_threads++;
80628ca06c5d42 Oleg Nesterov             2013-07-03  2300  			atomic_inc(&c=
urrent->signal->live);
60d4de3ff7f775 Elena Reshetova           2019-01-18  2301  			refcount_inc(=
&current->signal->sigcnt);
924de3b8c9410c Eric W. Biederman         2018-07-23  2302  			task_join_gro=
up_stop(p);
80628ca06c5d42 Oleg Nesterov             2013-07-03  2303  			list_add_tail=
_rcu(&p->thread_group,
80628ca06c5d42 Oleg Nesterov             2013-07-03  2304  					  &p->group=
_leader->thread_group);
0c740d0afc3bff Oleg Nesterov             2014-01-21  2305  			list_add_tail=
_rcu(&p->thread_node,
0c740d0afc3bff Oleg Nesterov             2014-01-21  2306  					  &p->signa=
l->thread_head);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2307  		}
8190773985141f Oleg Nesterov             2013-07-03  2308  		attach_pid(p, =
PIDTYPE_PID);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2309  		nr_threads++;
73b9ebfe126a4a Oleg Nesterov             2006-03-28  2310  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2311  	total_forks++;
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2312  	hlist_del_init(=
&delayed.node);
3f17da699431ec Oleg Nesterov             2006-02-15  2313  	spin_unlock(&cu=
rrent->sighand->siglock);
4af4206be2bd19 Oleg Nesterov             2014-04-13  2314  	syscall_tracepo=
int_update(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2315  	write_unlock_ir=
q(&tasklist_lock);
4af4206be2bd19 Oleg Nesterov             2014-04-13  2316  =

c13cf856cbe16a Andrew Morton             2005-11-28  2317  	proc_fork_conne=
ctor(p);
b53202e6308939 Oleg Nesterov             2015-12-03  2318  	cgroup_post_for=
k(p);
780de9dd2720de Ingo Molnar               2017-02-02  2319  	cgroup_threadgr=
oup_change_end(current);
cdd6c482c9ff9c Ingo Molnar               2009-09-21  2320  	perf_event_fork=
(p);
43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2321  =

43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2322  	trace_task_newt=
ask(p, clone_flags);
3ab679661721b1 Oleg Nesterov             2013-10-16  2323  	uprobe_copy_pro=
cess(p, clone_flags);
43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2324  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  2325  	return p;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2326  =

7e47682ea555e7 Aleksa Sarai              2015-06-09  2327  bad_fork_cancel_=
cgroup:
3fd37226216620 Kirill Tkhai              2017-05-12  2328  	spin_unlock(&cu=
rrent->sighand->siglock);
3fd37226216620 Kirill Tkhai              2017-05-12  2329  	write_unlock_ir=
q(&tasklist_lock);
b53202e6308939 Oleg Nesterov             2015-12-03  2330  	cgroup_cancel_f=
ork(p);
c3b7112df86b76 Christian Brauner         2019-05-10  2331  bad_fork_cgroup_=
threadgroup_change_end:
c3b7112df86b76 Christian Brauner         2019-05-10  2332  	cgroup_threadgr=
oup_change_end(current);
b3e5838252665e Christian Brauner         2019-03-27  2333  bad_fork_put_pid=
fd:
6fd2fe494b17bf Al Viro                   2019-06-26  2334  	if (clone_flags=
 & CLONE_PIDFD) {
6fd2fe494b17bf Al Viro                   2019-06-26  2335  		fput(pidfile);
6fd2fe494b17bf Al Viro                   2019-06-26  2336  		put_unused_fd(=
pidfd);
6fd2fe494b17bf Al Viro                   2019-06-26  2337  	}
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2338  bad_fork_free_pi=
d:
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2339  	if (pid !=3D &i=
nit_struct_pid)
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2340  		free_pid(pid);
0740aa5f637568 Jiri Slaby                2016-05-20  2341  bad_fork_cleanup=
_thread:
0740aa5f637568 Jiri Slaby                2016-05-20  2342  	exit_thread(p);
fd0928df98b957 Jens Axboe                2008-01-24  2343  bad_fork_cleanup=
_io:
b69f2292063d2c Louis Rilling             2009-12-04  2344  	if (p->io_conte=
xt)
b69f2292063d2c Louis Rilling             2009-12-04  2345  		exit_io_contex=
t(p);
ab516013ad9ca4 Serge E. Hallyn           2006-10-02  2346  bad_fork_cleanup=
_namespaces:
444f378b237a0f Linus Torvalds            2007-01-30  2347  	exit_task_names=
paces(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2348  bad_fork_cleanup=
_mm:
c3f3ce049f7d97 Andrea Arcangeli          2019-05-14  2349  	if (p->mm) {
c3f3ce049f7d97 Andrea Arcangeli          2019-05-14  2350  		mm_clear_owner=
(p->mm, p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2351  		mmput(p->mm);
c3f3ce049f7d97 Andrea Arcangeli          2019-05-14  2352  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2353  bad_fork_cleanup=
_signal:
4ab6c08336535f Oleg Nesterov             2009-08-26  2354  	if (!(clone_fla=
gs & CLONE_THREAD))
1c5354de90c900 Mike Galbraith            2011-01-05  2355  		free_signal_st=
ruct(p->signal);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2356  bad_fork_cleanup=
_sighand:
a7e5328a06a2be Oleg Nesterov             2006-03-28  2357  	__cleanup_sigha=
nd(p->sighand);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2358  bad_fork_cleanup=
_fs:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2359  	exit_fs(p); /* =
blocking */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2360  bad_fork_cleanup=
_files:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2361  	exit_files(p); =
/* blocking */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2362  bad_fork_cleanup=
_semundo:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2363  	exit_sem(p);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2364  bad_fork_cleanup=
_security:
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2365  	security_task_f=
ree(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2366  bad_fork_cleanup=
_audit:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2367  	audit_free(p);
6c72e3501d0d62 Peter Zijlstra            2014-10-02  2368  bad_fork_cleanup=
_perf:
cdd6c482c9ff9c Ingo Molnar               2009-09-21  2369  	perf_event_free=
_task(p);
6c72e3501d0d62 Peter Zijlstra            2014-10-02  2370  bad_fork_cleanup=
_policy:
b09be676e0ff25 Byungchul Park            2017-08-07  2371  	lockdep_free_ta=
sk(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2372  #ifdef CONFIG_NU=
MA
f0be3d32b05d3f Lee Schermerhorn          2008-04-28  2373  	mpol_put(p->mem=
policy);
e8604cb43690b7 Li Zefan                  2014-03-28  2374  bad_fork_cleanup=
_threadgroup_lock:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2375  #endif
35df17c57cecb0 Shailabh Nagar            2006-08-31  2376  	delayacct_tsk_f=
ree(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2377  bad_fork_cleanup=
_count:
d84f4f992cbd76 David Howells             2008-11-14  2378  	atomic_dec(&p->=
cred->user->processes);
e0e817392b9acf David Howells             2009-09-02  2379  	exit_creds(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2380  bad_fork_free:
405c0759712f57 Andy Lutomirski           2016-10-31  2381  	p->state =3D TA=
SK_DEAD;
68f24b08ee892d Andy Lutomirski           2016-09-15  2382  	put_task_stack(=
p);
c3f3ce049f7d97 Andrea Arcangeli          2019-05-14  2383  	delayed_free_ta=
sk(p);
fe7d37d1fbf8ff Oleg Nesterov             2006-01-08  2384  fork_out:
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2385  	spin_lock_irq(&=
current->sighand->siglock);
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2386  	hlist_del_init(=
&delayed.node);
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2387  	spin_unlock_irq=
(&current->sighand->siglock);
fe7d37d1fbf8ff Oleg Nesterov             2006-01-08 @2388  	return ERR_PTR(=
retval);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2389  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  2390  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============6922285791141833323==--


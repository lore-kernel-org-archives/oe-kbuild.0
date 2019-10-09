Content-Type: multipart/mixed; boundary="===============1330824394542898529=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [peterz-queue:locking/jump_label 19/30] kernel/tracepoint.c:296 tracepoint_remove_func() error: we previously assumed 'tp_funcs' could be null (see line 286)
Date: Wed, 09 Oct 2019 22:14:29 +0300
Message-ID: <20191009191429.GI13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1330824394542898529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/jump_label
head:   ef36041eb3c323ddc4050649298755a82b367782
commit: 0e669b8d46545cae6903cb0dd6fbfb4058728ce1 [19/30] tracepoints: Use s=
tatic_call

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/tracepoint.c:296 tracepoint_remove_func() error: we previously assum=
ed 'tp_funcs' could be null (see line 286)

# https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?=
id=3D0e669b8d46545cae6903cb0dd6fbfb4058728ce1
git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git=
/peterz/queue.git
git remote update peterz-queue
git checkout 0e669b8d46545cae6903cb0dd6fbfb4058728ce1
vim +/tp_funcs +296 kernel/tracepoint.c

de7b2973903c6c Mathieu Desnoyers       2014-04-08  272  static int tracepoi=
nt_remove_func(struct tracepoint *tp,
de7b2973903c6c Mathieu Desnoyers       2014-04-08  273  		struct tracepoint=
_func *func)
97e1c18e8d17bd Mathieu Desnoyers       2008-07-18  274  {
de7b2973903c6c Mathieu Desnoyers       2014-04-08  275  	struct tracepoint_=
func *old, *tp_funcs;
0e669b8d46545c Steven Rostedt (VMware  2018-10-05  276) 	int probes_left =
=3D 0;
97e1c18e8d17bd Mathieu Desnoyers       2008-07-18  277  =

b725dfea24b89d Mathieu Desnoyers       2014-04-09  278  	tp_funcs =3D rcu_d=
ereference_protected(tp->funcs,
b725dfea24b89d Mathieu Desnoyers       2014-04-09  279  			lockdep_is_held(=
&tracepoints_mutex));
0e669b8d46545c Steven Rostedt (VMware  2018-10-05  280) 	old =3D func_remov=
e(&tp_funcs, func, &probes_left);

I'm looking at FETCH_HEAD and func_remove() doesn't touch/use
probes_left.

de7b2973903c6c Mathieu Desnoyers       2014-04-08  281  	if (IS_ERR(old)) {
d66a270be3310d Mathieu Desnoyers       2018-03-15  282  		WARN_ON_ONCE(PTR_=
ERR(old) !=3D -ENOMEM);
de7b2973903c6c Mathieu Desnoyers       2014-04-08  283  		return PTR_ERR(ol=
d);
b75ef8b44b1cb9 Mathieu Desnoyers       2011-08-10  284  	}
b75ef8b44b1cb9 Mathieu Desnoyers       2011-08-10  285  =

de7b2973903c6c Mathieu Desnoyers       2014-04-08 @286  	if (!tp_funcs) {
de7b2973903c6c Mathieu Desnoyers       2014-04-08  287  		/* Removed last f=
unction */
de7b2973903c6c Mathieu Desnoyers       2014-04-08  288  		if (tp->unregfunc=
 && static_key_enabled(&tp->key))
de7b2973903c6c Mathieu Desnoyers       2014-04-08  289  			tp->unregfunc();
b75ef8b44b1cb9 Mathieu Desnoyers       2011-08-10  290  =

de7b2973903c6c Mathieu Desnoyers       2014-04-08  291  		if (static_key_en=
abled(&tp->key))
de7b2973903c6c Mathieu Desnoyers       2014-04-08  292  			static_key_slow_=
dec(&tp->key);
97e1c18e8d17bd Mathieu Desnoyers       2008-07-18  293  	}
0e669b8d46545c Steven Rostedt (VMware  2018-10-05  294) =

0e669b8d46545c Steven Rostedt (VMware  2018-10-05  295) 	__static_call_upda=
te(tp->static_call_key, tp->static_call_tramp,
0e669b8d46545c Steven Rostedt (VMware  2018-10-05 @296) 			     probes_left=
 =3D=3D 1 ? tp_funcs->func : tp->iterator);

So Smatch says that "The 'probes_left =3D=3D 1' condition is impossible, so
probably that just means I'm confused so I'm going to ignore it." so
then it complains that it's not clear if "tp_funcs" is NULL or not.

I could silence this false positive if I added an if statement:

	if (is_impossible_path())
		return;

I do that for some warnings but not for this one.

0e669b8d46545c Steven Rostedt (VMware  2018-10-05  297) =

de7b2973903c6c Mathieu Desnoyers       2014-04-08  298  	rcu_assign_pointer=
(tp->funcs, tp_funcs);
8058bd0faad860 Mathieu Desnoyers       2014-05-08  299  	release_probes(old=
);
de7b2973903c6c Mathieu Desnoyers       2014-04-08  300  	return 0;
127cafbb276266 Lai Jiangshan           2008-10-28  301  }
127cafbb276266 Lai Jiangshan           2008-10-28  302  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============1330824394542898529==--


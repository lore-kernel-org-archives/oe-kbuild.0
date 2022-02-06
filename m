Content-Type: multipart/mixed; boundary="===============0754563013354426971=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [oracle-dtrace:v2/5.17-rc2 8/10] fs/eventpoll.c:1224:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Sun, 06 Feb 2022 09:48:18 +0800
Message-ID: <202202060630.0kkTUrko-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0754563013354426971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Alcock <nick.alcock@oracle.com>
CC: Kris Van Hees <kris.van.hees@oracle.com>
CC: Tomas Jedlicka <tomas.jedlicka@oracle.com>
CC: Eugene Loh <eugene.loh@oracle.com>
CC: David Mc Lean <david.mclean@oracle.com>
CC: Vincent Lim <vincent.lim@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/5.17-rc2
head:   47946e7b2e2319f39cbb7f8aaa294298c2dec5b4
commit: 16ad67b61ac4f3dd93b3fa6875a011fff7b88500 [8/10] waitfd: new syscall=
 implementing waitpid() over fds
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/eventpoll.c:1224:3: warning: Assignment of function parameter has no =
effect outside the function. Did you forget dereferencing it? [uselessAssig=
nmentPtrArg]
     key =3D (void *)epi->fixed_event;
     ^
>> fs/eventpoll.c:1259:18: warning: Boolean result is used in bitwise opera=
tion. Clarify expression with parentheses. [clarifyCondition]
    if (fixed_event & !(epi->event.events & fixed_event))
                    ^

vim +1224 fs/eventpoll.c

a218cc4914209a Roman Penyaev      2019-03-07  1118  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1119  /*
7699acd1341c63 Davide Libenzi     2007-05-10  1120   * This is the callback=
 that is passed to the wait queue wakeup
bf6a41db7726e6 Daniel Baluta      2011-01-30  1121   * mechanism. It is cal=
led by the stored file descriptors when they
7699acd1341c63 Davide Libenzi     2007-05-10  1122   * have events to repor=
t.
a218cc4914209a Roman Penyaev      2019-03-07  1123   *
a6c67fee9cf095 Randy Dunlap       2021-03-01  1124   * This callback takes =
a read lock in order not to contend with concurrent
a6c67fee9cf095 Randy Dunlap       2021-03-01  1125   * events from another =
file descriptor, thus all modifications to ->rdllist
a218cc4914209a Roman Penyaev      2019-03-07  1126   * or ->ovflist are loc=
kless.  Read lock is paired with the write lock from
a218cc4914209a Roman Penyaev      2019-03-07  1127   * ep_scan_ready_list()=
, which stops all list modifications and guarantees
a218cc4914209a Roman Penyaev      2019-03-07  1128   * that lists state is =
seen correctly.
a218cc4914209a Roman Penyaev      2019-03-07  1129   *
a218cc4914209a Roman Penyaev      2019-03-07  1130   * Another thing worth =
to mention is that ep_poll_callback() can be called
a218cc4914209a Roman Penyaev      2019-03-07  1131   * concurrently for the=
 same @epi from different CPUs if poll table was inited
a218cc4914209a Roman Penyaev      2019-03-07  1132   * with several wait qu=
eues entries.  Plural wakeup from different CPUs of a
a218cc4914209a Roman Penyaev      2019-03-07  1133   * single wait queue is=
 serialized by wq.lock, but the case when multiple wait
a218cc4914209a Roman Penyaev      2019-03-07  1134   * queues are used shou=
ld be detected accordingly.  This is detected using
a218cc4914209a Roman Penyaev      2019-03-07  1135   * cmpxchg() operation.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1136   */
ac6424b981bce1 Ingo Molnar        2017-06-20  1137  static int ep_poll_call=
back(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1138  {
7699acd1341c63 Davide Libenzi     2007-05-10  1139  	int pwake =3D 0;
7699acd1341c63 Davide Libenzi     2007-05-10  1140  	struct epitem *epi =3D=
 ep_item_from_wait(wait);
7699acd1341c63 Davide Libenzi     2007-05-10  1141  	struct eventpoll *ep =
=3D epi->ep;
3ad6f93e98d6df Al Viro            2017-07-03  1142  	__poll_t pollflags =3D=
 key_to_poll(key);
a218cc4914209a Roman Penyaev      2019-03-07  1143  	unsigned long flags;
df0108c5da561c Jason Baron        2016-01-20  1144  	int ewake =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1145  =

a218cc4914209a Roman Penyaev      2019-03-07  1146  	read_lock_irqsave(&ep-=
>lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1147  =

bf3b9f6372c45b Sridhar Samudrala  2017-03-24  1148  	ep_set_busy_poll_napi_=
id(epi);
bf3b9f6372c45b Sridhar Samudrala  2017-03-24  1149  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1150  	/*
7699acd1341c63 Davide Libenzi     2007-05-10  1151  	 * If the event mask d=
oes not contain any poll(2) event, we consider the
7699acd1341c63 Davide Libenzi     2007-05-10  1152  	 * descriptor to be di=
sabled. This condition is likely the effect of the
7699acd1341c63 Davide Libenzi     2007-05-10  1153  	 * EPOLLONESHOT bit th=
at disables the descriptor when an event is received,
7699acd1341c63 Davide Libenzi     2007-05-10  1154  	 * until the next EPOL=
L_CTL_MOD will be issued.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1155  	 */
7699acd1341c63 Davide Libenzi     2007-05-10  1156  	if (!(epi->event.event=
s & ~EP_PRIVATE_BITS))
d47de16c722196 Davide Libenzi     2007-05-15  1157  		goto out_unlock;
d47de16c722196 Davide Libenzi     2007-05-15  1158  =

2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1159  	/*
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1160  	 * Check the events co=
ming with the callback. At this stage, not
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1161  	 * every device report=
s the events in the "key" parameter of the
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1162  	 * callback. We need t=
o be able to handle both cases here, hence the
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1163  	 * test for "key" !=3D=
 NULL before the event match test.
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1164  	 */
3ad6f93e98d6df Al Viro            2017-07-03  1165  	if (pollflags && !(pol=
lflags & epi->event.events))
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1166  		goto out_unlock;
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1167  =

d47de16c722196 Davide Libenzi     2007-05-15  1168  	/*
bf6a41db7726e6 Daniel Baluta      2011-01-30  1169  	 * If we are transferr=
ing events to userspace, we can hold no locks
d47de16c722196 Davide Libenzi     2007-05-15  1170  	 * (because we're acce=
ssing user memory, and because of linux f_op->poll()
bf6a41db7726e6 Daniel Baluta      2011-01-30  1171  	 * semantics). All the=
 events that happen during that period of time are
d47de16c722196 Davide Libenzi     2007-05-15  1172  	 * chained in ep->ovfl=
ist and requeued later on.
d47de16c722196 Davide Libenzi     2007-05-15  1173  	 */
c5a282e9635e9c Davidlohr Bueso    2019-01-03  1174  	if (READ_ONCE(ep->ovfl=
ist) !=3D EP_UNACTIVE_PTR) {
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1175  		if (chain_epi_lockles=
s(epi))
c3e320b61581ef Roman Penyaev      2019-03-07  1176  			ep_pm_stay_awake_rcu=
(epi);
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1177  	} else if (!ep_is_link=
ed(epi)) {
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1178  		/* In the usual case,=
 add event to ready list. */
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1179  		if (list_add_tail_loc=
kless(&epi->rdllink, &ep->rdllist))
eea1d585917c53 Eric Wong          2013-04-30  1180  			ep_pm_stay_awake_rcu=
(epi);
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g     2012-05-01  1181  	}
7699acd1341c63 Davide Libenzi     2007-05-10  1182  =

7699acd1341c63 Davide Libenzi     2007-05-10  1183  	/*
7699acd1341c63 Davide Libenzi     2007-05-10  1184  	 * Wake up ( if active=
 ) both the eventpoll wait list and the ->poll()
7699acd1341c63 Davide Libenzi     2007-05-10  1185  	 * wait list.
7699acd1341c63 Davide Libenzi     2007-05-10  1186  	 */
df0108c5da561c Jason Baron        2016-01-20  1187  	if (waitqueue_active(&=
ep->wq)) {
b6a515c8a0f6c2 Jason Baron        2016-02-05  1188  		if ((epi->event.event=
s & EPOLLEXCLUSIVE) &&
3ad6f93e98d6df Al Viro            2017-07-03  1189  					!(pollflags & POLL=
FREE)) {
3ad6f93e98d6df Al Viro            2017-07-03  1190  			switch (pollflags & =
EPOLLINOUT_BITS) {
a9a08845e9acbd Linus Torvalds     2018-02-11  1191  			case EPOLLIN:
a9a08845e9acbd Linus Torvalds     2018-02-11  1192  				if (epi->event.even=
ts & EPOLLIN)
b6a515c8a0f6c2 Jason Baron        2016-02-05  1193  					ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1194  				break;
a9a08845e9acbd Linus Torvalds     2018-02-11  1195  			case EPOLLOUT:
a9a08845e9acbd Linus Torvalds     2018-02-11  1196  				if (epi->event.even=
ts & EPOLLOUT)
b6a515c8a0f6c2 Jason Baron        2016-02-05  1197  					ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1198  				break;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1199  			case 0:
df0108c5da561c Jason Baron        2016-01-20  1200  				ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1201  				break;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1202  			}
b6a515c8a0f6c2 Jason Baron        2016-02-05  1203  		}
a218cc4914209a Roman Penyaev      2019-03-07  1204  		wake_up(&ep->wq);
df0108c5da561c Jason Baron        2016-01-20  1205  	}
7699acd1341c63 Davide Libenzi     2007-05-10  1206  	if (waitqueue_active(&=
ep->poll_wait))
7699acd1341c63 Davide Libenzi     2007-05-10  1207  		pwake++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1208  =

d47de16c722196 Davide Libenzi     2007-05-15  1209  out_unlock:
a218cc4914209a Roman Penyaev      2019-03-07  1210  	read_unlock_irqrestore=
(&ep->lock, flags);
7699acd1341c63 Davide Libenzi     2007-05-10  1211  =

7699acd1341c63 Davide Libenzi     2007-05-10  1212  	/* We have to call thi=
s outside the lock */
7699acd1341c63 Davide Libenzi     2007-05-10  1213  	if (pwake)
efcdd350d1f8a9 Jason Baron        2020-04-06  1214  		ep_poll_safewake(ep, =
epi);
7699acd1341c63 Davide Libenzi     2007-05-10  1215  =

138e4ad67afd5c Oleg Nesterov      2017-09-01  1216  	if (!(epi->event.event=
s & EPOLLEXCLUSIVE))
138e4ad67afd5c Oleg Nesterov      2017-09-01  1217  		ewake =3D 1;
138e4ad67afd5c Oleg Nesterov      2017-09-01  1218  =

16ad67b61ac4f3 Nick Alcock        2018-11-14  1219  	/*
16ad67b61ac4f3 Nick Alcock        2018-11-14  1220  	 * If this fd type has=
 a hardwired event which should override the key
16ad67b61ac4f3 Nick Alcock        2018-11-14  1221  	 * (e.g. if it is wait=
ing on a non-file waitqueue), jam it in here.
16ad67b61ac4f3 Nick Alcock        2018-11-14  1222  	 */
16ad67b61ac4f3 Nick Alcock        2018-11-14  1223  	if (epi->fixed_event)
16ad67b61ac4f3 Nick Alcock        2018-11-14 @1224  		key =3D (void *)epi->=
fixed_event;
16ad67b61ac4f3 Nick Alcock        2018-11-14  1225  =

3ad6f93e98d6df Al Viro            2017-07-03  1226  	if (pollflags & POLLFR=
EE) {
138e4ad67afd5c Oleg Nesterov      2017-09-01  1227  		/*
138e4ad67afd5c Oleg Nesterov      2017-09-01  1228  		 * If we race with ep=
_remove_wait_queue() it can miss
138e4ad67afd5c Oleg Nesterov      2017-09-01  1229  		 * ->whead =3D NULL a=
nd do another remove_wait_queue() after
138e4ad67afd5c Oleg Nesterov      2017-09-01  1230  		 * us, so we can't us=
e __remove_wait_queue().
138e4ad67afd5c Oleg Nesterov      2017-09-01  1231  		 */
138e4ad67afd5c Oleg Nesterov      2017-09-01  1232  		list_del_init(&wait->=
entry);
138e4ad67afd5c Oleg Nesterov      2017-09-01  1233  		/*
138e4ad67afd5c Oleg Nesterov      2017-09-01  1234  		 * ->whead !=3D NULL =
protects us from the race with ep_free()
138e4ad67afd5c Oleg Nesterov      2017-09-01  1235  		 * or ep_remove(), ep=
_remove_wait_queue() takes whead->lock
138e4ad67afd5c Oleg Nesterov      2017-09-01  1236  		 * held by the caller=
. Once we nullify it, nothing protects
138e4ad67afd5c Oleg Nesterov      2017-09-01  1237  		 * ep/epi or even wai=
t.
138e4ad67afd5c Oleg Nesterov      2017-09-01  1238  		 */
138e4ad67afd5c Oleg Nesterov      2017-09-01  1239  		smp_store_release(&ep=
_pwq_from_wait(wait)->whead, NULL);
138e4ad67afd5c Oleg Nesterov      2017-09-01  1240  	}
df0108c5da561c Jason Baron        2016-01-20  1241  =

138e4ad67afd5c Oleg Nesterov      2017-09-01  1242  	return ewake;
7699acd1341c63 Davide Libenzi     2007-05-10  1243  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1244  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1245  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1246   * This is the callback=
 that is used to add our wait queue to the
^1da177e4c3f41 Linus Torvalds     2005-04-16  1247   * target file wakeup l=
ists.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1248   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1249  static void ep_ptable_q=
ueue_proc(struct file *file, wait_queue_head_t *whead,
16ad67b61ac4f3 Nick Alcock        2018-11-14  1250  				 poll_table *pt, un=
signed long fixed_event)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1251  {
364f374f22ba1b Al Viro            2020-09-02  1252  	struct ep_pqueue *epq =
=3D container_of(pt, struct ep_pqueue, pt);
364f374f22ba1b Al Viro            2020-09-02  1253  	struct epitem *epi =3D=
 epq->epi;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1254  	struct eppoll_entry *p=
wq;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1255  =

364f374f22ba1b Al Viro            2020-09-02  1256  	if (unlikely(!epi))	//=
 an earlier allocation has failed
364f374f22ba1b Al Viro            2020-09-02  1257  		return;
364f374f22ba1b Al Viro            2020-09-02  1258  =

16ad67b61ac4f3 Nick Alcock        2018-11-14 @1259  	if (fixed_event & !(ep=
i->event.events & fixed_event))
16ad67b61ac4f3 Nick Alcock        2018-11-14  1260  		return;
16ad67b61ac4f3 Nick Alcock        2018-11-14  1261  =

16ad67b61ac4f3 Nick Alcock        2018-11-14  1262  	if (fixed_event)
16ad67b61ac4f3 Nick Alcock        2018-11-14  1263  		epi->fixed_event =3D =
fixed_event;
16ad67b61ac4f3 Nick Alcock        2018-11-14  1264  =

364f374f22ba1b Al Viro            2020-09-02  1265  	pwq =3D kmem_cache_all=
oc(pwq_cache, GFP_KERNEL);
364f374f22ba1b Al Viro            2020-09-02  1266  	if (unlikely(!pwq)) {
364f374f22ba1b Al Viro            2020-09-02  1267  		epq->epi =3D NULL;
364f374f22ba1b Al Viro            2020-09-02  1268  		return;
364f374f22ba1b Al Viro            2020-09-02  1269  	}
364f374f22ba1b Al Viro            2020-09-02  1270  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1271  	init_waitqueue_func_en=
try(&pwq->wait, ep_poll_callback);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1272  	pwq->whead =3D whead;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1273  	pwq->base =3D epi;
df0108c5da561c Jason Baron        2016-01-20  1274  	if (epi->event.events =
& EPOLLEXCLUSIVE)
df0108c5da561c Jason Baron        2016-01-20  1275  		add_wait_queue_exclus=
ive(whead, &pwq->wait);
df0108c5da561c Jason Baron        2016-01-20  1276  	else
^1da177e4c3f41 Linus Torvalds     2005-04-16  1277  		add_wait_queue(whead,=
 &pwq->wait);
80285b75c68348 Al Viro            2020-09-02  1278  	pwq->next =3D epi->pwq=
list;
80285b75c68348 Al Viro            2020-09-02  1279  	epi->pwqlist =3D pwq;
296e236e96ddde Davide Libenzi     2009-03-31  1280  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1281  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0754563013354426971==--


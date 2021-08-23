Content-Type: multipart/mixed; boundary="===============7641965848237218062=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/eventpoll.c:1629:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Mon, 23 Aug 2021 11:59:03 +0800
Message-ID: <202108231128.fBhlKhF5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7641965848237218062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93
commit: ff07952aeda8563d5080da3a0754db83ed0650f6 ep_send_events_proc(): fol=
d into the caller
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/appletalk/ddp.c:988:4: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
      offset +=3D copy;
      ^
>> fs/notify/fanotify/fanotify_user.c:431:3: warning: Assignment of functio=
n parameter has no effect outside the function. Did you forget dereferencin=
g it? [uselessAssignmentPtrArg]
     buf +=3D ret;
     ^
>> fs/notify/fanotify/fanotify_user.c:432:3: warning: Assignment of functio=
n parameter has no effect outside the function. [uselessAssignmentArg]
     count -=3D ret;
     ^
>> fs/eventpoll.c:1629:3: warning: Assignment of function parameter has no =
effect outside the function. Did you forget dereferencing it? [uselessAssig=
nmentPtrArg]
     events++;
     ^

vim +1629 fs/eventpoll.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1565  =

ff07952aeda856 Al Viro         2020-08-31  1566  static int ep_send_events(=
struct eventpoll *ep,
ff07952aeda856 Al Viro         2020-08-31  1567  			  struct epoll_event __=
user *events, int maxevents)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1568  {
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1569  	struct epitem *epi, *tmp;
ff07952aeda856 Al Viro         2020-08-31  1570  	LIST_HEAD(txlist);
626cf236608505 Hans Verkuil    2012-03-23  1571  	poll_table pt;
ff07952aeda856 Al Viro         2020-08-31  1572  	int res =3D 0;
626cf236608505 Hans Verkuil    2012-03-23  1573  =

626cf236608505 Hans Verkuil    2012-03-23  1574  	init_poll_funcptr(&pt, NU=
LL);
ff07952aeda856 Al Viro         2020-08-31  1575  =

ff07952aeda856 Al Viro         2020-08-31  1576  	ep_start_scan(ep, 0, fals=
e, &txlist);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1577  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1578  	/*
5071f97ec6d74f Davide Libenzi  2009-03-31  1579  	 * We can loop without lo=
ck because we are passed a task private list.
5071f97ec6d74f Davide Libenzi  2009-03-31  1580  	 * Items cannot vanish du=
ring the loop because ep_scan_ready_list() is
5071f97ec6d74f Davide Libenzi  2009-03-31  1581  	 * holding "mtx" during t=
his call.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1582  	 */
21877e1a5b5201 Davidlohr Bueso 2019-01-03  1583  	lockdep_assert_held(&ep->=
mtx);
21877e1a5b5201 Davidlohr Bueso 2019-01-03  1584  =

ff07952aeda856 Al Viro         2020-08-31  1585  	list_for_each_entry_safe(=
epi, tmp, &txlist, rdllink) {
ff07952aeda856 Al Viro         2020-08-31  1586  		struct wakeup_source *ws;
ff07952aeda856 Al Viro         2020-08-31  1587  		__poll_t revents;
ff07952aeda856 Al Viro         2020-08-31  1588  =

ff07952aeda856 Al Viro         2020-08-31  1589  		if (res >=3D maxevents)
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1590  			break;
d47de16c722196 Davide Libenzi  2007-05-15  1591  =

4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1592  		/*
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1593  		 * Activate ep=
->ws before deactivating epi->ws to prevent
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1594  		 * triggering =
auto-suspend here (in case we reactive epi->ws
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1595  		 * below).
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1596  		 *
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1597  		 * This could =
be rearranged to delay the deactivation of epi->ws
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1598  		 * instead, bu=
t then epi->ws would temporarily be out of sync
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1599  		 * with ep_is_=
linked().
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1600  		 */
eea1d585917c53 Eric Wong       2013-04-30  1601  		ws =3D ep_wakeup_source(=
epi);
eea1d585917c53 Eric Wong       2013-04-30  1602  		if (ws) {
eea1d585917c53 Eric Wong       2013-04-30  1603  			if (ws->active)
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g  2012-05-01  1604  				__pm_stay_aw=
ake(ep->ws);
eea1d585917c53 Eric Wong       2013-04-30  1605  			__pm_relax(ws);
eea1d585917c53 Eric Wong       2013-04-30  1606  		}
eea1d585917c53 Eric Wong       2013-04-30  1607  =

d47de16c722196 Davide Libenzi  2007-05-15  1608  		list_del_init(&epi->rdll=
ink);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1609  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1610  		/*
5071f97ec6d74f Davide Libenzi  2009-03-31  1611  		 * If the event mask int=
ersect the caller-requested one,
5071f97ec6d74f Davide Libenzi  2009-03-31  1612  		 * deliver the event to =
userspace. Again, ep_scan_ready_list()
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1613  		 * is holding ep->mtx, s=
o no operations coming from userspace
5071f97ec6d74f Davide Libenzi  2009-03-31  1614  		 * can change the item.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1615  		 */
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1616  		revents =3D ep_item_poll=
(epi, &pt, 1);
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1617  		if (!revents)
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1618  			continue;
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1619  =

ff07952aeda856 Al Viro         2020-08-31  1620  		if (__put_user(revents, =
&events->events) ||
ff07952aeda856 Al Viro         2020-08-31  1621  		    __put_user(epi->even=
t.data, &events->data)) {
ff07952aeda856 Al Viro         2020-08-31  1622  			list_add(&epi->rdllink,=
 &txlist);
eea1d585917c53 Eric Wong       2013-04-30  1623  			ep_pm_stay_awake(epi);
ff07952aeda856 Al Viro         2020-08-31  1624  			if (!res)
ff07952aeda856 Al Viro         2020-08-31  1625  				res =3D -EFAULT;
ff07952aeda856 Al Viro         2020-08-31  1626  			break;
d0305882825784 Tony Battersby  2009-03-31  1627  		}
ff07952aeda856 Al Viro         2020-08-31  1628  		res++;
ff07952aeda856 Al Viro         2020-08-31 @1629  		events++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1630  		if (epi->event.events & =
EPOLLONESHOT)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1631  			epi->event.events &=3D =
EP_PRIVATE_BITS;
296e236e96ddde Davide Libenzi  2009-03-31  1632  		else if (!(epi->event.ev=
ents & EPOLLET)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1633  			/*
296e236e96ddde Davide Libenzi  2009-03-31  1634  			 * If this file has bee=
n added with Level
296e236e96ddde Davide Libenzi  2009-03-31  1635  			 * Trigger mode, we nee=
d to insert back inside
296e236e96ddde Davide Libenzi  2009-03-31  1636  			 * the ready list, so t=
hat the next call to
296e236e96ddde Davide Libenzi  2009-03-31  1637  			 * epoll_wait() will ch=
eck again the events
296e236e96ddde Davide Libenzi  2009-03-31  1638  			 * availability. At thi=
s point, no one can insert
296e236e96ddde Davide Libenzi  2009-03-31  1639  			 * into ep->rdllist bes=
ides us. The epoll_ctl()
296e236e96ddde Davide Libenzi  2009-03-31  1640  			 * callers are locked o=
ut by
296e236e96ddde Davide Libenzi  2009-03-31  1641  			 * ep_scan_ready_list()=
 holding "mtx" and the
296e236e96ddde Davide Libenzi  2009-03-31  1642  			 * poll callback will q=
ueue them in ep->ovflist.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1643  			 */
d47de16c722196 Davide Libenzi  2007-05-15  1644  			list_add_tail(&epi->rdl=
link, &ep->rdllist);
eea1d585917c53 Eric Wong       2013-04-30  1645  			ep_pm_stay_awake(epi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1646  		}
9ce209d64d820a Davide Libenzi  2008-10-17  1647  	}
443f1a0422338a Al Viro         2020-08-31  1648  	ep_done_scan(ep, 0, false=
, &txlist);
443f1a0422338a Al Viro         2020-08-31  1649  =

ff07952aeda856 Al Viro         2020-08-31  1650  	return res;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1651  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1652  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7641965848237218062==--


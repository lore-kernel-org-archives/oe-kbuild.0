Content-Type: multipart/mixed; boundary="===============5169886542379904864=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.6/muqss 1/18] kernel/sched/MuQSS.c:613:3: warning: Either the condition '!task' is redundant or there is possible null pointer dereference: task. [nullPointerRedundantCheck]
Date: Sat, 09 May 2020 09:06:09 +0800
Message-ID: <202005090901.SxgfOX0O%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5169886542379904864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Con Kolivas <kernel@kolivas.org>
CC: Steven Barrett <steven@liquorix.net>

tree:   https://github.com/zen-kernel/zen-kernel 5.6/muqss
head:   e70073b6a71de959a53ff82f74481c15fa23b2cd
commit: edbc5ae3fb7ae074a02e40802df66ae90ff4888e [1/18] MultiQueue Skiplist=
 Scheduler v0.198
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/sched/MuQSS.c:613:3: warning: Either the condition '!task' is red=
undant or there is possible null pointer dereference: task. [nullPointerRed=
undantCheck]
     task->wake_q.next =3D NULL;
     ^
   kernel/sched/MuQSS.c:610:10: note: Assuming that condition '!task' is no=
t redundant
     BUG_ON(!task);
            ^
   kernel/sched/MuQSS.c:609:22: note: Assignment 'task=3Dcontainer_of(node,=
struct task_struct,wake_q)', assigned value is 0
     task =3D container_of(node, struct task_struct, wake_q);
                        ^
   kernel/sched/MuQSS.c:613:3: note: Null pointer dereference
     task->wake_q.next =3D NULL;
     ^
>> kernel/sched/MuQSS.c:4812:18: warning: Local variable 'rlim_rtprio' shad=
ows outer variable [shadowVariable]
      unsigned long rlim_rtprio =3D
                    ^
   kernel/sched/MuQSS.c:4754:16: note: Shadowed declaration
    unsigned long rlim_rtprio =3D 0;
                  ^
   kernel/sched/MuQSS.c:4812:18: note: Shadow variable
      unsigned long rlim_rtprio =3D
                    ^

# https://github.com/zen-kernel/zen-kernel/commit/edbc5ae3fb7ae074a02e40802=
df66ae90ff4888e
git remote add zen-kernel-zen-kernel https://github.com/zen-kernel/zen-kern=
el
git remote update zen-kernel-zen-kernel
git checkout edbc5ae3fb7ae074a02e40802df66ae90ff4888e
vim +613 kernel/sched/MuQSS.c

edbc5ae3fb7ae07 Con Kolivas 2019-10-25  601  =

edbc5ae3fb7ae07 Con Kolivas 2019-10-25  602  void wake_up_q(struct wake_q_h=
ead *head)
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  603  {
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  604  	struct wake_q_node *node =3D =
head->first;
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  605  =

edbc5ae3fb7ae07 Con Kolivas 2019-10-25  606  	while (node !=3D WAKE_Q_TAIL)=
 {
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  607  		struct task_struct *task;
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  608  =

edbc5ae3fb7ae07 Con Kolivas 2019-10-25  609  		task =3D container_of(node, =
struct task_struct, wake_q);
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  610  		BUG_ON(!task);
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  611  		/* Task can safely be re-ins=
erted now */
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  612  		node =3D node->next;
edbc5ae3fb7ae07 Con Kolivas 2019-10-25 @613  		task->wake_q.next =3D NULL;
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  614  =

edbc5ae3fb7ae07 Con Kolivas 2019-10-25  615  		/*
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  616  		 * wake_up_process() execute=
s a full barrier, which pairs with
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  617  		 * the queueing in wake_q_ad=
d() so as not to miss wakeups.
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  618  		 */
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  619  		wake_up_process(task);
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  620  		put_task_struct(task);
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  621  	}
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  622  }
edbc5ae3fb7ae07 Con Kolivas 2019-10-25  623  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5169886542379904864==--


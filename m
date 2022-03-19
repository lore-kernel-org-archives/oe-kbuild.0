Content-Type: multipart/mixed; boundary="===============4640425449705452623=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.18/block 125/127] block/blk-throttle.c:1188 throtl_pending_timer_fn() error: we previously assumed 'tg' could be null (see line 1146)
Date: Sat, 19 Mar 2022 12:50:39 +0800
Message-ID: <202203191245.PiGwwAAl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4640425449705452623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ming Lei <ming.lei@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.18/block
head:   8f9e7b65f833cb9a4b2e2f54a049d74df394d906
commit: ee37eddbfa9e0401f13a01691cf4bbbacd2d16c9 [125/127] block: avoid use=
-after-free on throttle data
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-m031-20220318 (https://download.01.org/0day-ci/=
archive/20220319/202203191245.PiGwwAAl-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
block/blk-throttle.c:1188 throtl_pending_timer_fn() error: we previously as=
sumed 'tg' could be null (see line 1146)

vim +/tg +1188 block/blk-throttle.c

e43473b7f223ec Vivek Goyal       2010-09-15  1117  =

c79892c5576163 Shaohua Li        2017-03-27  1118  static bool throtl_can_u=
pgrade(struct throtl_data *td,
c79892c5576163 Shaohua Li        2017-03-27  1119  	struct throtl_grp *this=
_tg);
6e1a5704cbbd24 Tejun Heo         2013-05-14  1120  /**
6e1a5704cbbd24 Tejun Heo         2013-05-14  1121   * throtl_pending_timer_=
fn - timer function for service_queue->pending_timer
216382dccb2e0c Bart Van Assche   2019-05-30  1122   * @t: the pending_timer=
 member of the throtl_service_queue being serviced
6e1a5704cbbd24 Tejun Heo         2013-05-14  1123   *
6e1a5704cbbd24 Tejun Heo         2013-05-14  1124   * This timer is armed w=
hen a child throtl_grp with active bio's become
6e1a5704cbbd24 Tejun Heo         2013-05-14  1125   * pending and queued on=
 the service_queue's pending_tree and expires when
6e1a5704cbbd24 Tejun Heo         2013-05-14  1126   * the first child throt=
l_grp should be dispatched.  This function
2e48a530a3a7da Tejun Heo         2013-05-14  1127   * dispatches bio's from=
 the children throtl_grps to the parent
2e48a530a3a7da Tejun Heo         2013-05-14  1128   * service_queue.
2e48a530a3a7da Tejun Heo         2013-05-14  1129   *
2e48a530a3a7da Tejun Heo         2013-05-14  1130   * If the parent's paren=
t is another throtl_grp, dispatching is propagated
2e48a530a3a7da Tejun Heo         2013-05-14  1131   * by either arming its =
pending_timer or repeating dispatch directly.  If
2e48a530a3a7da Tejun Heo         2013-05-14  1132   * the top-level service=
_tree is reached, throtl_data->dispatch_work is
2e48a530a3a7da Tejun Heo         2013-05-14  1133   * kicked so that the re=
ady bio's are issued.
6e1a5704cbbd24 Tejun Heo         2013-05-14  1134   */
e99e88a9d2b067 Kees Cook         2017-10-16  1135  static void throtl_pendi=
ng_timer_fn(struct timer_list *t)
69df0ab030c94e Tejun Heo         2013-05-14  1136  {
e99e88a9d2b067 Kees Cook         2017-10-16  1137  	struct throtl_service_q=
ueue *sq =3D from_timer(sq, t, pending_timer);
2e48a530a3a7da Tejun Heo         2013-05-14  1138  	struct throtl_grp *tg =
=3D sq_to_tg(sq);
69df0ab030c94e Tejun Heo         2013-05-14  1139  	struct throtl_data *td =
=3D sq_to_td(sq);
2e48a530a3a7da Tejun Heo         2013-05-14  1140  	struct throtl_service_q=
ueue *parent_sq;
ee37eddbfa9e04 Ming Lei          2022-03-18  1141  	struct request_queue *q;
2e48a530a3a7da Tejun Heo         2013-05-14  1142  	bool dispatched;
6e1a5704cbbd24 Tejun Heo         2013-05-14  1143  	int ret;
e43473b7f223ec Vivek Goyal       2010-09-15  1144  =

ee37eddbfa9e04 Ming Lei          2022-03-18  1145  	/* throtl_data may be g=
one, so figure out request queue by blkg */
ee37eddbfa9e04 Ming Lei          2022-03-18 @1146  	if (tg)
ee37eddbfa9e04 Ming Lei          2022-03-18  1147  		q =3D tg->pd.blkg->q;
ee37eddbfa9e04 Ming Lei          2022-03-18  1148  	else
ee37eddbfa9e04 Ming Lei          2022-03-18  1149  		q =3D td->queue;
ee37eddbfa9e04 Ming Lei          2022-03-18  1150  =

0d945c1f966b2b Christoph Hellwig 2018-11-15  1151  	spin_lock_irq(&q->queue=
_lock);
ee37eddbfa9e04 Ming Lei          2022-03-18  1152  =

ee37eddbfa9e04 Ming Lei          2022-03-18  1153  	if (!q->root_blkg)
ee37eddbfa9e04 Ming Lei          2022-03-18  1154  		goto out_unlock;
ee37eddbfa9e04 Ming Lei          2022-03-18  1155  =

c79892c5576163 Shaohua Li        2017-03-27  1156  	if (throtl_can_upgrade(=
td, NULL))
c79892c5576163 Shaohua Li        2017-03-27  1157  		throtl_upgrade_state(t=
d);
c79892c5576163 Shaohua Li        2017-03-27  1158  =

2e48a530a3a7da Tejun Heo         2013-05-14  1159  again:
2e48a530a3a7da Tejun Heo         2013-05-14  1160  	parent_sq =3D sq->paren=
t_sq;
2e48a530a3a7da Tejun Heo         2013-05-14  1161  	dispatched =3D false;
e43473b7f223ec Vivek Goyal       2010-09-15  1162  =

7f52f98c2a8333 Tejun Heo         2013-05-14  1163  	while (true) {
fda6f272c77a7a Tejun Heo         2013-05-14  1164  		throtl_log(sq, "dispat=
ch nr_queued=3D%u read=3D%u write=3D%u",
2e48a530a3a7da Tejun Heo         2013-05-14  1165  			   sq->nr_queued[READ=
] + sq->nr_queued[WRITE],
2e48a530a3a7da Tejun Heo         2013-05-14  1166  			   sq->nr_queued[READ=
], sq->nr_queued[WRITE]);
e43473b7f223ec Vivek Goyal       2010-09-15  1167  =

7f52f98c2a8333 Tejun Heo         2013-05-14  1168  		ret =3D throtl_select_=
dispatch(sq);
7f52f98c2a8333 Tejun Heo         2013-05-14  1169  		if (ret) {
7f52f98c2a8333 Tejun Heo         2013-05-14  1170  			throtl_log(sq, "bios =
disp=3D%u", ret);
7f52f98c2a8333 Tejun Heo         2013-05-14  1171  			dispatched =3D true;
651930bc1c2a25 Tejun Heo         2013-05-14  1172  		}
e43473b7f223ec Vivek Goyal       2010-09-15  1173  =

7f52f98c2a8333 Tejun Heo         2013-05-14  1174  		if (throtl_schedule_ne=
xt_dispatch(sq, false))
7f52f98c2a8333 Tejun Heo         2013-05-14  1175  			break;
7f52f98c2a8333 Tejun Heo         2013-05-14  1176  =

7f52f98c2a8333 Tejun Heo         2013-05-14  1177  		/* this dispatch windo=
ws is still open, relax and repeat */
0d945c1f966b2b Christoph Hellwig 2018-11-15  1178  		spin_unlock_irq(&q->qu=
eue_lock);
7f52f98c2a8333 Tejun Heo         2013-05-14  1179  		cpu_relax();
0d945c1f966b2b Christoph Hellwig 2018-11-15  1180  		spin_lock_irq(&q->queu=
e_lock);
7f52f98c2a8333 Tejun Heo         2013-05-14  1181  	}
6a525600ffeb9e Tejun Heo         2013-05-14  1182  =

2e48a530a3a7da Tejun Heo         2013-05-14  1183  	if (!dispatched)
2e48a530a3a7da Tejun Heo         2013-05-14  1184  		goto out_unlock;
6e1a5704cbbd24 Tejun Heo         2013-05-14  1185  =

2e48a530a3a7da Tejun Heo         2013-05-14  1186  	if (parent_sq) {
2e48a530a3a7da Tejun Heo         2013-05-14  1187  		/* @parent_sq is anoth=
er throl_grp, propagate dispatch */
2e48a530a3a7da Tejun Heo         2013-05-14 @1188  		if (tg->flags & THROTL=
_TG_WAS_EMPTY) {
2e48a530a3a7da Tejun Heo         2013-05-14  1189  			tg_update_disptime(tg=
);
2e48a530a3a7da Tejun Heo         2013-05-14  1190  			if (!throtl_schedule_=
next_dispatch(parent_sq, false)) {
2e48a530a3a7da Tejun Heo         2013-05-14  1191  				/* window is already=
 open, repeat dispatching */
2e48a530a3a7da Tejun Heo         2013-05-14  1192  				sq =3D parent_sq;
2e48a530a3a7da Tejun Heo         2013-05-14  1193  				tg =3D sq_to_tg(sq);
2e48a530a3a7da Tejun Heo         2013-05-14  1194  				goto again;
2e48a530a3a7da Tejun Heo         2013-05-14  1195  			}
2e48a530a3a7da Tejun Heo         2013-05-14  1196  		}
2e48a530a3a7da Tejun Heo         2013-05-14  1197  	} else {
b53b072c4bb579 Baolin Wang       2020-09-07  1198  		/* reached the top-lev=
el, queue issuing */
2e48a530a3a7da Tejun Heo         2013-05-14  1199  		queue_work(kthrotld_wo=
rkqueue, &td->dispatch_work);
2e48a530a3a7da Tejun Heo         2013-05-14  1200  	}
2e48a530a3a7da Tejun Heo         2013-05-14  1201  out_unlock:
0d945c1f966b2b Christoph Hellwig 2018-11-15  1202  	spin_unlock_irq(&q->que=
ue_lock);
6e1a5704cbbd24 Tejun Heo         2013-05-14  1203  }
e43473b7f223ec Vivek Goyal       2010-09-15  1204  =


:::::: The code at line 1188 was first introduced by commit
:::::: 2e48a530a3a7daebd0cc17866304a36d39b611de blk-throttle: make throtl_p=
ending_timer_fn() ready for hierarchy

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4640425449705452623==--


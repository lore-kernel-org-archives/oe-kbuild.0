Content-Type: multipart/mixed; boundary="===============4051121451887096687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] btrfs: send: add support for fs-verity
Date: Mon, 08 Aug 2022 14:10:12 +0800
Message-ID: <202208081452.5uhcUjew-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4051121451887096687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <7ac3a01572a872f8779f357598215e0e07d191bd.1659379913.git.boris=
@bur.io>
References: <7ac3a01572a872f8779f357598215e0e07d191bd.1659379913.git.boris(=
a)bur.io>
TO: Boris Burkov <boris@bur.io>
TO: linux-fscrypt(a)vger.kernel.org
TO: linux-btrfs(a)vger.kernel.org
TO: kernel-team(a)fb.com

Hi Boris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20220805]
[cannot apply to fscrypt/fsverity v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Burkov/btrfs-s=
end-add-support-for-fs-verity/20220802-025522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m031-20220801 (https://download.01.org/0day-ci/ar=
chive/20220808/202208081452.5uhcUjew-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/nvme/target/tcp.c:1634 nvmet_tcp_alloc_queue() warn: '&queue->queue=
_list' not removed from list
fs/btrfs/send.c:4974 process_new_verity() warn: ignoring unreachable code.

vim +1634 drivers/nvme/target/tcp.c

872d26a391da92 Sagi Grimberg 2018-12-03  1577  =

872d26a391da92 Sagi Grimberg 2018-12-03  1578  static int nvmet_tcp_alloc_q=
ueue(struct nvmet_tcp_port *port,
872d26a391da92 Sagi Grimberg 2018-12-03  1579  		struct socket *newsock)
872d26a391da92 Sagi Grimberg 2018-12-03  1580  {
872d26a391da92 Sagi Grimberg 2018-12-03  1581  	struct nvmet_tcp_queue *que=
ue;
872d26a391da92 Sagi Grimberg 2018-12-03  1582  	int ret;
872d26a391da92 Sagi Grimberg 2018-12-03  1583  =

872d26a391da92 Sagi Grimberg 2018-12-03  1584  	queue =3D kzalloc(sizeof(*q=
ueue), GFP_KERNEL);
872d26a391da92 Sagi Grimberg 2018-12-03  1585  	if (!queue)
872d26a391da92 Sagi Grimberg 2018-12-03  1586  		return -ENOMEM;
872d26a391da92 Sagi Grimberg 2018-12-03  1587  =

872d26a391da92 Sagi Grimberg 2018-12-03  1588  	INIT_WORK(&queue->release_w=
ork, nvmet_tcp_release_queue_work);
872d26a391da92 Sagi Grimberg 2018-12-03  1589  	INIT_WORK(&queue->io_work, =
nvmet_tcp_io_work);
872d26a391da92 Sagi Grimberg 2018-12-03  1590  	queue->sock =3D newsock;
872d26a391da92 Sagi Grimberg 2018-12-03  1591  	queue->port =3D port;
872d26a391da92 Sagi Grimberg 2018-12-03  1592  	queue->nr_cmds =3D 0;
872d26a391da92 Sagi Grimberg 2018-12-03  1593  	spin_lock_init(&queue->stat=
e_lock);
872d26a391da92 Sagi Grimberg 2018-12-03  1594  	queue->state =3D NVMET_TCP_=
Q_CONNECTING;
872d26a391da92 Sagi Grimberg 2018-12-03  1595  	INIT_LIST_HEAD(&queue->free=
_list);
872d26a391da92 Sagi Grimberg 2018-12-03  1596  	init_llist_head(&queue->res=
p_list);
872d26a391da92 Sagi Grimberg 2018-12-03  1597  	INIT_LIST_HEAD(&queue->resp=
_send_list);
872d26a391da92 Sagi Grimberg 2018-12-03  1598  =

44f331a630bdc7 Sagi Grimberg 2022-02-14  1599  	queue->idx =3D ida_alloc(&n=
vmet_tcp_queue_ida, GFP_KERNEL);
872d26a391da92 Sagi Grimberg 2018-12-03  1600  	if (queue->idx < 0) {
872d26a391da92 Sagi Grimberg 2018-12-03  1601  		ret =3D queue->idx;
872d26a391da92 Sagi Grimberg 2018-12-03  1602  		goto out_free_queue;
872d26a391da92 Sagi Grimberg 2018-12-03  1603  	}
872d26a391da92 Sagi Grimberg 2018-12-03  1604  =

872d26a391da92 Sagi Grimberg 2018-12-03  1605  	ret =3D nvmet_tcp_alloc_cmd=
(queue, &queue->connect);
872d26a391da92 Sagi Grimberg 2018-12-03  1606  	if (ret)
872d26a391da92 Sagi Grimberg 2018-12-03  1607  		goto out_ida_remove;
872d26a391da92 Sagi Grimberg 2018-12-03  1608  =

872d26a391da92 Sagi Grimberg 2018-12-03  1609  	ret =3D nvmet_sq_init(&queu=
e->nvme_sq);
872d26a391da92 Sagi Grimberg 2018-12-03  1610  	if (ret)
872d26a391da92 Sagi Grimberg 2018-12-03  1611  		goto out_free_connect;
872d26a391da92 Sagi Grimberg 2018-12-03  1612  =

872d26a391da92 Sagi Grimberg 2018-12-03  1613  	nvmet_prepare_receive_pdu(q=
ueue);
872d26a391da92 Sagi Grimberg 2018-12-03  1614  =

872d26a391da92 Sagi Grimberg 2018-12-03  1615  	mutex_lock(&nvmet_tcp_queue=
_mutex);
872d26a391da92 Sagi Grimberg 2018-12-03  1616  	list_add_tail(&queue->queue=
_list, &nvmet_tcp_queue_list);
872d26a391da92 Sagi Grimberg 2018-12-03  1617  	mutex_unlock(&nvmet_tcp_que=
ue_mutex);
872d26a391da92 Sagi Grimberg 2018-12-03  1618  =

872d26a391da92 Sagi Grimberg 2018-12-03  1619  	ret =3D nvmet_tcp_set_queue=
_sock(queue);
872d26a391da92 Sagi Grimberg 2018-12-03  1620  	if (ret)
872d26a391da92 Sagi Grimberg 2018-12-03  1621  		goto out_destroy_sq;
872d26a391da92 Sagi Grimberg 2018-12-03  1622  =

872d26a391da92 Sagi Grimberg 2018-12-03  1623  	return 0;
872d26a391da92 Sagi Grimberg 2018-12-03  1624  out_destroy_sq:
872d26a391da92 Sagi Grimberg 2018-12-03  1625  	mutex_lock(&nvmet_tcp_queue=
_mutex);
872d26a391da92 Sagi Grimberg 2018-12-03  1626  	list_del_init(&queue->queue=
_list);
872d26a391da92 Sagi Grimberg 2018-12-03  1627  	mutex_unlock(&nvmet_tcp_que=
ue_mutex);
872d26a391da92 Sagi Grimberg 2018-12-03  1628  	nvmet_sq_destroy(&queue->nv=
me_sq);
872d26a391da92 Sagi Grimberg 2018-12-03  1629  out_free_connect:
872d26a391da92 Sagi Grimberg 2018-12-03  1630  	nvmet_tcp_free_cmd(&queue->=
connect);
872d26a391da92 Sagi Grimberg 2018-12-03  1631  out_ida_remove:
44f331a630bdc7 Sagi Grimberg 2022-02-14  1632  	ida_free(&nvmet_tcp_queue_i=
da, queue->idx);
872d26a391da92 Sagi Grimberg 2018-12-03  1633  out_free_queue:
872d26a391da92 Sagi Grimberg 2018-12-03 @1634  	kfree(queue);
872d26a391da92 Sagi Grimberg 2018-12-03  1635  	return ret;
872d26a391da92 Sagi Grimberg 2018-12-03  1636  }
872d26a391da92 Sagi Grimberg 2018-12-03  1637  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4051121451887096687==--


Content-Type: multipart/mixed; boundary="===============7657979078929175848=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [block:for-5.8/drivers 62/115] drivers/nvme/host/fc.c:1533:22-26: ERROR: invalid reference to the index variable of the iterator on line 1511
Date: Sun, 10 May 2020 09:06:39 +0800
Message-ID: <202005100935.eZP2cFU8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7657979078929175848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: James Smart <jsmart2021@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hannes Reinecke <hare@suse.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.8/drivers
head:   92decf118f1da4c866515f80387f9cf4d48611d6
commit: 14fd1e98afafc0027a6a86ea1962e31dceafb400 [62/115] nvme-fc: Add Disc=
onnect Association Rcv support
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/nvme/host/fc.c:1533:22-26: ERROR: invalid reference to the index=
 variable of the iterator on line 1511

# https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/com=
mit/?id=3D14fd1e98afafc0027a6a86ea1962e31dceafb400
git remote add block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/=
linux-block.git
git remote update block
git checkout 14fd1e98afafc0027a6a86ea1962e31dceafb400
vim +1533 drivers/nvme/host/fc.c

14fd1e98afafc0 James Smart 2020-03-31  1497  =

14fd1e98afafc0 James Smart 2020-03-31  1498  static struct nvme_fc_ctrl *
14fd1e98afafc0 James Smart 2020-03-31  1499  nvme_fc_match_disconn_ls(struc=
t nvme_fc_rport *rport,
14fd1e98afafc0 James Smart 2020-03-31  1500  		      struct nvmefc_ls_rcv_o=
p *lsop)
14fd1e98afafc0 James Smart 2020-03-31  1501  {
14fd1e98afafc0 James Smart 2020-03-31  1502  	struct fcnvme_ls_disconnect_a=
ssoc_rqst *rqst =3D
14fd1e98afafc0 James Smart 2020-03-31  1503  					&lsop->rqstbuf->rq_dis_as=
soc;
14fd1e98afafc0 James Smart 2020-03-31  1504  	struct nvme_fc_ctrl *ctrl, *r=
et =3D NULL;
14fd1e98afafc0 James Smart 2020-03-31  1505  	struct nvmefc_ls_rcv_op *oldl=
s =3D NULL;
14fd1e98afafc0 James Smart 2020-03-31  1506  	u64 association_id =3D be64_t=
o_cpu(rqst->associd.association_id);
14fd1e98afafc0 James Smart 2020-03-31  1507  	unsigned long flags;
14fd1e98afafc0 James Smart 2020-03-31  1508  =

14fd1e98afafc0 James Smart 2020-03-31  1509  	spin_lock_irqsave(&rport->loc=
k, flags);
14fd1e98afafc0 James Smart 2020-03-31  1510  =

14fd1e98afafc0 James Smart 2020-03-31 @1511  	list_for_each_entry(ctrl, &rp=
ort->ctrl_list, ctrl_list) {
14fd1e98afafc0 James Smart 2020-03-31  1512  		if (!nvme_fc_ctrl_get(ctrl))
14fd1e98afafc0 James Smart 2020-03-31  1513  			continue;
14fd1e98afafc0 James Smart 2020-03-31  1514  		spin_lock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1515  		if (association_id =3D=3D ct=
rl->association_id) {
14fd1e98afafc0 James Smart 2020-03-31  1516  			oldls =3D ctrl->rcv_disconn;
14fd1e98afafc0 James Smart 2020-03-31  1517  			ctrl->rcv_disconn =3D lsop;
14fd1e98afafc0 James Smart 2020-03-31  1518  			ret =3D ctrl;
14fd1e98afafc0 James Smart 2020-03-31  1519  		}
14fd1e98afafc0 James Smart 2020-03-31  1520  		spin_unlock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1521  		if (ret)
14fd1e98afafc0 James Smart 2020-03-31  1522  			/* leave the ctrl get refer=
ence */
14fd1e98afafc0 James Smart 2020-03-31  1523  			break;
14fd1e98afafc0 James Smart 2020-03-31  1524  		nvme_fc_ctrl_put(ctrl);
14fd1e98afafc0 James Smart 2020-03-31  1525  	}
14fd1e98afafc0 James Smart 2020-03-31  1526  =

14fd1e98afafc0 James Smart 2020-03-31  1527  	spin_unlock_irqrestore(&rport=
->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1528  =

14fd1e98afafc0 James Smart 2020-03-31  1529  	/* transmit a response for an=
ything that was pending */
14fd1e98afafc0 James Smart 2020-03-31  1530  	if (oldls) {
14fd1e98afafc0 James Smart 2020-03-31  1531  		dev_info(rport->lport->dev,
14fd1e98afafc0 James Smart 2020-03-31  1532  			"NVME-FC{%d}: Multiple Disc=
onnect Association "
14fd1e98afafc0 James Smart 2020-03-31 @1533  			"LS's received\n", ctrl->cn=
um);
14fd1e98afafc0 James Smart 2020-03-31  1534  		/* overwrite good response w=
ith bogus failure */
14fd1e98afafc0 James Smart 2020-03-31  1535  		oldls->lsrsp->rsplen =3D nvm=
e_fc_format_rjt(oldls->rspbuf,
14fd1e98afafc0 James Smart 2020-03-31  1536  						sizeof(*oldls->rspbuf),
14fd1e98afafc0 James Smart 2020-03-31  1537  						rqst->w0.ls_cmd,
14fd1e98afafc0 James Smart 2020-03-31  1538  						FCNVME_RJT_RC_UNAB,
14fd1e98afafc0 James Smart 2020-03-31  1539  						FCNVME_RJT_EXP_NONE, 0);
14fd1e98afafc0 James Smart 2020-03-31  1540  		nvme_fc_xmt_ls_rsp(oldls);
14fd1e98afafc0 James Smart 2020-03-31  1541  	}
14fd1e98afafc0 James Smart 2020-03-31  1542  =

14fd1e98afafc0 James Smart 2020-03-31  1543  	return ret;
14fd1e98afafc0 James Smart 2020-03-31  1544  }
14fd1e98afafc0 James Smart 2020-03-31  1545  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7657979078929175848==--


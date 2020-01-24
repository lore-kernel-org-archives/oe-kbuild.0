Content-Type: multipart/mixed; boundary="===============5173137072891834181=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/4] staging: wilc1000: remove use of infinite loop conditions
Date: Fri, 24 Jan 2020 09:04:32 +0300
Message-ID: <20200124060432.GE1870@kadam>
In-Reply-To: <20200117160157.8706-2-ajay.kathat@microchip.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5173137072891834181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Ajay,

url:    https://github.com/0day-ci/linux/commits/Ajay-Kathat-microchip-com/=
staging-wilc1000-handle-few-full-driver-review-comments/20200118-064137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
270f104ba26f0498aff85e5b002e2f4c2249c04b

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/wilc1000/wlan.c:663 wilc_wlan_handle_txq() error: double un=
locked 'wilc->hif_cs' (orig line 575)

# https://github.com/0day-ci/linux/commit/afb35a84bfc18d51ed5ffebd87d7f4cf0=
7c3b44e
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout afb35a84bfc18d51ed5ffebd87d7f4cf07c3b44e
vim +663 drivers/staging/wilc1000/wlan.c

a41047962ac053 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  528  	if (i =3D=3D 0)
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  529  		goto out;
ac087c82c4ec08 drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  530  	vmm_table[i] =3D 0x0;
a41047962ac053 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  531  =

b997b84ffca6ab drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12  532  	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);

Acquire here.

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  533  	counter =3D 0;
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  534  	func =3D wilc->hif_func;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  535  	do {
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  536  		ret =3D func->hif_read_reg(wilc, WILC_HOST_TX_CTRL, &reg);
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  537  		if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  538  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  539  =

4ee4b9da2b0142 drivers/staging/wilc1000/wilc_wlan.c Elizabeth Ferdman  2016=
-09-30  540  		if ((reg & 0x1) =3D=3D 0)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  541  			break;
4ee4b9da2b0142 drivers/staging/wilc1000/wilc_wlan.c Elizabeth Ferdman  2016=
-09-30  542  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  543  		counter++;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  544  		if (counter > 200) {
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  545  			counter =3D 0;
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  546  			ret =3D func->hif_write_reg(wilc, WILC_HOST_TX_CTRL, 0);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  547  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  548  		}
67e2a07ed8008b drivers/staging/wilc1000/wilc_wlan.c Glen Lee           2015=
-12-21  549  	} while (!wilc->quit);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  550  =

39823a50ff371c drivers/staging/wilc1000/wilc_wlan.c Alison Schofield   2015=
-10-08  551  	if (!ret)
588bf3c1162604 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  552  		goto out_release_bus;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  553  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  554  	timeout =3D 200;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  555  	do {
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  556  		ret =3D func->hif_block_tx(wilc,
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  557  					 WILC_VMM_TBL_RX_SHADOW_BASE,
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  558  					 (u8 *)vmm_table,
f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  559  					 ((i + 1) * 4));
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  560  		if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  561  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  562  =

f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  563  		ret =3D func->hif_write_reg(wilc, WILC_HOST_VMM_CTL, 0x2);
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  564  		if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  565  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  566  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  567  		do {
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  568  			ret =3D func->hif_read_reg(wilc, WILC_HOST_VMM_CTL, &reg);
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  569  			if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  570  				break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  571  			if ((reg >> 2) & 0x1) {
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  572  				entries =3D ((reg >> 3) & 0x3f);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  573  				break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  574  			}
b997b84ffca6ab drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12 @575  			release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
                                                                           =
                                     ^^^^^^^^^^^

Bus is released here.



c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  576  		} while (--timeout);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  577  		if (timeout <=3D 0) {
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  578  			ret =3D func->hif_write_reg(wilc, WILC_HOST_VMM_CTL, 0x0);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  579  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  580  		}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  581  =

39823a50ff371c drivers/staging/wilc1000/wilc_wlan.c Alison Schofield   2015=
-10-08  582  		if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  583  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  584  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  585  		if (entries =3D=3D 0) {
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  586  			ret =3D func->hif_read_reg(wilc, WILC_HOST_TX_CTRL, &reg);
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  587  			if (!ret)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  588  				break;
ffda203c0cf3b5 drivers/staging/wilc1000/wilc_wlan.c Anish Bhatt        2015=
-09-29  589  			reg &=3D ~BIT(0);
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  590  			ret =3D func->hif_write_reg(wilc, WILC_HOST_TX_CTRL, reg);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  591  		}
afb35a84bfc18d drivers/staging/wilc1000/wlan.c      Ajay Singh         2020=
-01-17  592  	} while (0);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  593  =

39823a50ff371c drivers/staging/wilc1000/wilc_wlan.c Alison Schofield   2015=
-10-08  594  	if (!ret)
588bf3c1162604 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  595  		goto out_release_bus;
                                                                           =
                             ^^^^^^^^^^^^^^^^^^^^

39823a50ff371c drivers/staging/wilc1000/wilc_wlan.c Alison Schofield   2015=
-10-08  596  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  597  	if (entries =3D=3D 0) {
68b4f745cf1963 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12  598  		ret =3D -ENOBUFS;
588bf3c1162604 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  599  		goto out_release_bus;
                                                                           =
                             ^^^^^^^^^^^^^^^^^^^^
Released again in these gotos.

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  600  	}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  601  =

b997b84ffca6ab drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12  602  	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  603  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  604  	offset =3D 0;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  605  	i =3D 0;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  606  	do {
fbc2fe16afa3f3 drivers/staging/wilc1000/wilc_wlan.c Chaehyun Lim       2015=
-09-15  607  		u32 header, buffer_offset;
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  608  		char *bssid;
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  609  =

82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  610  		tqe =3D wilc_wlan_txq_remove_from_head(dev);
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  611  		if (!tqe)
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  612  			break;
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  613  =

9bc061e8805487 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2019=
-06-26  614  		vif =3D tqe->vif;
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  615  		if (vmm_table[i] =3D=3D 0)
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  616  			break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  617  =

02211edc9a1f71 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-08-01  618  		le32_to_cpus(&vmm_table[i]);
ac087c82c4ec08 drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  619  		vmm_sz =3D (vmm_table[i] & 0x3ff);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  620  		vmm_sz *=3D 4;
ab12d8c773f86c drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  621  		header =3D (tqe->type << 31) |
ab12d8c773f86c drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  622  			 (tqe->buffer_size << 15) |
ab12d8c773f86c drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  623  			 vmm_sz;
78174adaf59e85 drivers/staging/wilc1000/wilc_wlan.c Chandra S Gorentla 2015=
-08-08  624  		if (tqe->type =3D=3D WILC_MGMT_PKT)
ffda203c0cf3b5 drivers/staging/wilc1000/wilc_wlan.c Anish Bhatt        2015=
-09-29  625  			header |=3D BIT(30);
78174adaf59e85 drivers/staging/wilc1000/wilc_wlan.c Chandra S Gorentla 2015=
-08-08  626  		else
ffda203c0cf3b5 drivers/staging/wilc1000/wilc_wlan.c Anish Bhatt        2015=
-09-29  627  			header &=3D ~BIT(30);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  628  =

02211edc9a1f71 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-08-01  629  		cpu_to_le32s(&header);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  630  		memcpy(&txb[offset], &header, 4);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  631  		if (tqe->type =3D=3D WILC_CFG_PKT) {
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  632  			buffer_offset =3D ETH_CONFIG_PKT_HDR_OFFSET;
590c0a39650f02 drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  633  		} else if (tqe->type =3D=3D WILC_NET_PKT) {
9bc061e8805487 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2019=
-06-26  634  			bssid =3D tqe->vif->bssid;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  635  			buffer_offset =3D ETH_ETHERNET_HDR_OFFSET;
1bbf6a6d4091af drivers/staging/wilc1000/wilc_wlan.c Aditya Shankar     2017=
-11-03  636  			memcpy(&txb[offset + 8], bssid, 6);
590c0a39650f02 drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  637  		} else {
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  638  			buffer_offset =3D HOST_HDR_OFFSET;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  639  		}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  640  =

ab12d8c773f86c drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  641  		memcpy(&txb[offset + buffer_offset],
ab12d8c773f86c drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  642  		       tqe->buffer, tqe->buffer_size);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  643  		offset +=3D vmm_sz;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  644  		i++;
ac087c82c4ec08 drivers/staging/wilc1000/wilc_wlan.c Leo Kim            2015=
-11-06  645  		tqe->status =3D 1;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  646  		if (tqe->tx_complete_func)
82059dcec99e50 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  647  			tqe->tx_complete_func(tqe->priv, tqe->status);
f31e5584dc555f drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-09-04  648  		if (tqe->ack_idx !=3D NOT_TCP_ACK &&
f31e5584dc555f drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-09-04  649  		    tqe->ack_idx < MAX_PENDING_ACKS)
f31e5584dc555f drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-09-04  650  			vif->ack_filter.pending_acks[tqe->ack_idx].txqe =3D NULL;
a18dd63047a86e drivers/staging/wilc1000/wilc_wlan.c Greg Kroah-Hartman 2015=
-09-03  651  		kfree(tqe);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  652  	} while (--entries);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  653  =

b997b84ffca6ab drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12  654  	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  655  =

f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  656  	ret =3D func->hif_clear_int_ext(wilc, ENABLE_TX_VMM);
133b22d694c7a4 drivers/staging/wilc1000/wilc_wlan.c Chris Park         2016=
-02-04  657  	if (!ret)
588bf3c1162604 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  658  		goto out_release_bus;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  659  =

f782497c099102 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-16  660  	ret =3D func->hif_block_tx_ext(wilc, 0, txb, offset);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  661  =

588bf3c1162604 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  662  out_release_bus:
b997b84ffca6ab drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-11-12 @663  	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  664  =

891256180aea96 drivers/staging/wilc1000/wilc_wlan.c Ajay Singh         2018=
-02-26  665  out:
334bed089d3d74 drivers/staging/wilc1000/wilc_wlan.c Binoy Jayan        2016=
-06-15  666  	mutex_unlock(&wilc->txq_add_to_head_cs);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  667  =

67e2a07ed8008b drivers/staging/wilc1000/wilc_wlan.c Glen Lee           2015=
-12-21  668  	*txq_count =3D wilc->txq_entries;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  669  	return ret;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wlan.c Johnny Kim         2015=
-05-11  670  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5173137072891834181==--


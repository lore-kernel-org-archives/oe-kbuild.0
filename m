Content-Type: multipart/mixed; boundary="===============0536381104286890003=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [hare-scsi-devel:reserved-tags.v3 30/41] drivers/scsi/snic/snic_scsi.c:1711:1: sparse: sparse: context imbalance in 'snic_dr_clean_single_req' - different lock contexts for basic block
Date: Fri, 01 May 2020 14:07:30 +0800
Message-ID: <202005011454.v0M827sR%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0536381104286890003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hannes Reinecke <hare@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 reserved-tags.v3
head:   7e846b812c89291eaaf342f3a37944fefc17473b
commit: 183c7fff937d1eb611c630552ed5d1922196f451 [30/41] snic: use tagset i=
ter for traversing commands
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 183c7fff937d1eb611c630552ed5d1922196f451
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 19 hours ago
:::::: commit date: 21 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/scsi/snic/snic_scsi.c:1711:1: sparse: sparse: context imbalance =
in 'snic_dr_clean_single_req' - different lock contexts for basic block

# https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commi=
t/?id=3D183c7fff937d1eb611c630552ed5d1922196f451
git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/=
git/hare/scsi-devel.git
git remote update hare-scsi-devel
git checkout 183c7fff937d1eb611c630552ed5d1922196f451
vim +/snic_dr_clean_single_req +1711 drivers/scsi/snic/snic_scsi.c

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1709  =

183c7fff937d1eb Hannes Reinecke   2019-03-24  1710  static bool
183c7fff937d1eb Hannes Reinecke   2019-03-24 @1711  snic_dr_clean_single_re=
q(struct scsi_cmnd *sc, void *data, bool reserved)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1712  {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1713  	struct snic_req_info *=
rqi =3D NULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1714  	struct snic_tgt *tgt =
=3D NULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1715  	spinlock_t *io_lock =
=3D NULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1716  	u32 sv_state =3D 0, tm=
f =3D 0;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1717  	DECLARE_COMPLETION_ONS=
TACK(tm_done);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1718  	unsigned long flags;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1719  	int ret =3D 0;
183c7fff937d1eb Hannes Reinecke   2019-03-24  1720  	struct snic_cmd_pendin=
g_iter_data *iter_data =3D data;
183c7fff937d1eb Hannes Reinecke   2019-03-24  1721  	struct snic *snic =3D =
iter_data->snic;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1722  =

183c7fff937d1eb Hannes Reinecke   2019-03-24  1723  	if (reserved)
183c7fff937d1eb Hannes Reinecke   2019-03-24  1724  		return true;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1725  =

183c7fff937d1eb Hannes Reinecke   2019-03-24  1726  	if (sc->device !=3D it=
er_data->sdev)
183c7fff937d1eb Hannes Reinecke   2019-03-24  1727  		return true;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1728  =

183c7fff937d1eb Hannes Reinecke   2019-03-24  1729  	io_lock =3D snic_io_lo=
ck_tag(snic, sc->request->tag);
183c7fff937d1eb Hannes Reinecke   2019-03-24  1730  	spin_lock_irqsave(io_l=
ock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1731  	rqi =3D (struct snic_r=
eq_info *) CMD_SP(sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1732  	if (!rqi)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1733  		goto skip_clean;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1734  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1735  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1736  	if (CMD_STATE(sc) =3D=
=3D SNIC_IOREQ_ABTS_PENDING)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1737  		goto skip_clean;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1738  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1739  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1740  	if ((CMD_FLAGS(sc) & S=
NIC_DEVICE_RESET) &&
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1741  			(!(CMD_FLAGS(sc) & S=
NIC_DEV_RST_ISSUED))) {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1742  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1743  		SNIC_SCSI_DBG(snic->s=
host,
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1744  			      "clean_single_=
req: devrst is not pending sc 0x%p\n",
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1745  			      sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1746  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1747  		goto skip_clean;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1748  	}
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1749  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1750  	SNIC_SCSI_DBG(snic->sh=
ost,
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1751  		"clean_single_req: Fo=
und IO in %s on lun\n",
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1752  		snic_ioreq_state_to_s=
tr(CMD_STATE(sc)));
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1753  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1754  	/* Save Command State =
*/
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1755  	sv_state =3D CMD_STATE=
(sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1756  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1757  	/*
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1758  	 * Any pending IO issu=
ed prior to reset is expected to be
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1759  	 * in abts pending sta=
te, if not we need to set SNIC_IOREQ_ABTS_PENDING
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1760  	 * to indicate the IO =
is abort pending.
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1761  	 * When IO is complete=
d, the IO will be handed over and handled
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1762  	 * in this function.
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1763  	 */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1764  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1765  	CMD_STATE(sc) =3D SNIC=
_IOREQ_ABTS_PENDING;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1766  	SNIC_BUG_ON(rqi->abts_=
done);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1767  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1768  	if (CMD_FLAGS(sc) & SN=
IC_DEVICE_RESET) {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1769  		rqi->tm_tag =3D SNIC_=
TAG_DEV_RST;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1770  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1771  		SNIC_SCSI_DBG(snic->s=
host,
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1772  			      "clean_single_=
req:devrst sc 0x%p\n", sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1773  	}
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1774  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1775  	CMD_ABTS_STATUS(sc) =
=3D SNIC_INVALID_CODE;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1776  	rqi->abts_done =3D &tm=
_done;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1777  	spin_unlock_irqrestore=
(io_lock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1778  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1779  	tgt =3D starget_to_tgt=
(scsi_target(sc->device));
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1780  	if ((snic_tgt_chkready=
(tgt) !=3D 0) && (tgt->tdata.typ =3D=3D SNIC_TGT_SAN))
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1781  		tmf =3D SNIC_ITMF_ABT=
S_TASK_TERM;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1782  	else
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1783  		tmf =3D SNIC_ITMF_ABT=
S_TASK;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1784  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1785  	/* Now queue the abort=
 command to firmware */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1786  	ret =3D snic_queue_abo=
rt_req(snic, rqi, sc, tmf);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1787  	if (ret) {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1788  		SNIC_HOST_ERR(snic->s=
host,
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1789  			      "clean_single_=
req_err:sc %p, tag %d abt failed. tm_tag %d flags 0x%llx\n",
183c7fff937d1eb Hannes Reinecke   2019-03-24  1790  			      sc, sc->reques=
t->tag, rqi->tm_tag, CMD_FLAGS(sc));
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1791  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1792  		spin_lock_irqsave(io_=
lock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1793  		rqi =3D (struct snic_=
req_info *) CMD_SP(sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1794  		if (rqi)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1795  			rqi->abts_done =3D N=
ULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1796  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1797  		/* Restore Command St=
ate */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1798  		if (CMD_STATE(sc) =3D=
=3D SNIC_IOREQ_ABTS_PENDING)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1799  			CMD_STATE(sc) =3D sv=
_state;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1800  =

183c7fff937d1eb Hannes Reinecke   2019-03-24  1801  		iter_data->ret =3D 1;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1802  		goto skip_clean;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1803  	}
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1804  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1805  	spin_lock_irqsave(io_l=
ock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1806  	if (CMD_FLAGS(sc) & SN=
IC_DEVICE_RESET)
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1807  		CMD_FLAGS(sc) |=3D SN=
IC_DEV_RST_TERM_ISSUED;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1808  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1809  	CMD_FLAGS(sc) |=3D SNI=
C_IO_INTERNAL_TERM_ISSUED;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1810  	spin_unlock_irqrestore=
(io_lock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1811  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1812  	wait_for_completion_ti=
meout(&tm_done, SNIC_ABTS_TIMEOUT);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1813  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1814  	/* Recheck cmd state t=
o check if it now aborted. */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1815  	spin_lock_irqsave(io_l=
ock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1816  	rqi =3D (struct snic_r=
eq_info *) CMD_SP(sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1817  	if (!rqi) {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1818  		CMD_FLAGS(sc) |=3D SN=
IC_IO_ABTS_TERM_REQ_NULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1819  		goto skip_clean;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1820  	}
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1821  	rqi->abts_done =3D NUL=
L;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1822  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1823  	/* if abort is still p=
ending w/ fw, fail */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1824  	if (CMD_ABTS_STATUS(sc=
) =3D=3D SNIC_INVALID_CODE) {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1825  		SNIC_HOST_ERR(snic->s=
host,
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1826  			      "clean_single_=
req_err:sc %p tag %d abt still pending w/ fw, tm_tag %d flags 0x%llx\n",
183c7fff937d1eb Hannes Reinecke   2019-03-24  1827  			      sc, sc->reques=
t->tag, rqi->tm_tag, CMD_FLAGS(sc));
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1828  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1829  		CMD_FLAGS(sc) |=3D SN=
IC_IO_ABTS_TERM_DONE;
183c7fff937d1eb Hannes Reinecke   2019-03-24  1830  		iter_data->ret =3D 1;
183c7fff937d1eb Hannes Reinecke   2019-03-24  1831  	} else {
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1832  		CMD_STATE(sc) =3D SNI=
C_IOREQ_ABTS_COMPLETE;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1833  		CMD_SP(sc) =3D NULL;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1834  		spin_unlock_irqrestor=
e(io_lock, flags);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1835  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1836  		snic_release_req_buf(=
snic, rqi, sc);
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1837  =

f352a0d5bafa62d Narsimhulu Musini 2016-03-17  1838  		sc->result =3D (DID_E=
RROR << 16);
f352a0d5bafa62d Narsimhulu Musini 2016-03-17  1839  		sc->scsi_done(sc);
183c7fff937d1eb Hannes Reinecke   2019-03-24  1840  	}
183c7fff937d1eb Hannes Reinecke   2019-03-24  1841  	return true;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1842  =

c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1843  skip_clean:
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1844  	spin_unlock_irqrestore=
(io_lock, flags);
183c7fff937d1eb Hannes Reinecke   2019-03-24  1845  	return true;
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1846  } /* end of snic_dr_cle=
an_single_req */
c8806b6c9e824f4 Narsimhulu Musini 2015-05-29  1847  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0536381104286890003==--


Content-Type: multipart/mixed; boundary="===============4730982220704506149=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [hare-scsi-devel:reserved-tags.v3 39/41] drivers/scsi/hisi_sas/hisi_sas_main.c:1972:1: warning: Label 'err_out' is not used. [unusedLabel]
Date: Fri, 01 May 2020 17:00:30 +0800
Message-ID: <202005011633.sa8Wlw5d%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4730982220704506149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 reserved-tags.v3
head:   7e846b812c89291eaaf342f3a37944fefc17473b
commit: 0b5ae3c0eabfefb5573b84647788cc5d9af89135 [39/41] hisi_sas: use task=
 tag to reference the slot
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/scsi/hisi_sas/hisi_sas_main.c:1972:1: warning: Label 'err_out' i=
s not used. [unusedLabel]
   err_out:
   ^
   drivers/scsi/hisi_sas/hisi_sas_main.c:1045:6: warning: Null pointer dere=
ference: r [ctunullpointer]
    if (r->minimum_linkrate > SAS_LINK_RATE_1_5_GBPS)
        ^
   drivers/scsi/hisi_sas/hisi_sas_main.c:819:22: note: Calling function his=
i_sas_control_phy, 3rd argument is null
    hisi_sas_control_phy(sas_phy, PHY_FUNC_LINK_RESET, NULL);
                        ^
   drivers/scsi/hisi_sas/hisi_sas_main.c:1094:10: note: Calling function hi=
si_sas_phy_set_linkrate, 3rd argument is null
     return hisi_sas_phy_set_linkrate(hisi_hba, phy_no, funcdata);
            ^
   drivers/scsi/hisi_sas/hisi_sas_main.c:1045:6: note: Dereferencing argume=
nt r that is null
    if (r->minimum_linkrate > SAS_LINK_RATE_1_5_GBPS)
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commi=
t/?id=3D0b5ae3c0eabfefb5573b84647788cc5d9af89135
git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/=
git/hare/scsi-devel.git
git remote update hare-scsi-devel
git checkout 0b5ae3c0eabfefb5573b84647788cc5d9af89135
vim +/err_out +1972 drivers/scsi/hisi_sas/hisi_sas_main.c

0efff300c72df7 John Garry      2015-11-18  1899  =

441c27401470c4 John Garry      2016-08-24  1900  static int
ad6048325c7807 John Garry      2017-06-14  1901  hisi_sas_internal_abort_ta=
sk_exec(struct hisi_hba *hisi_hba, int device_id,
441c27401470c4 John Garry      2016-08-24  1902  				  struct sas_task *tas=
k, int abort_flag,
795f25a31b542d John Garry      2019-02-06  1903  				  int task_tag, struct=
 hisi_sas_dq *dq)
441c27401470c4 John Garry      2016-08-24  1904  {
441c27401470c4 John Garry      2016-08-24  1905  	struct domain_device *dev=
ice =3D task->dev;
441c27401470c4 John Garry      2016-08-24  1906  	struct hisi_sas_device *s=
as_dev =3D device->lldd_dev;
11b752490a051b John Garry      2017-06-14  1907  	struct device *dev =3D hi=
si_hba->dev;
441c27401470c4 John Garry      2016-08-24  1908  	struct hisi_sas_port *por=
t;
441c27401470c4 John Garry      2016-08-24  1909  	struct hisi_sas_slot *slo=
t;
2e244f0f5bcaa9 John Garry      2017-03-23  1910  	struct asd_sas_port *sas_=
port =3D device->port;
441c27401470c4 John Garry      2016-08-24  1911  	struct hisi_sas_cmd_hdr *=
cmd_hdr_base;
441c27401470c4 John Garry      2016-08-24  1912  	int dlvry_queue_slot, dlv=
ry_queue, n_elem =3D 0, rc, slot_idx;
897cc769bcc092 John Garry      2019-08-05  1913  	unsigned long flags;
fa222db0b03689 Xiang Chen      2018-05-09  1914  	int wr_q_index;
441c27401470c4 John Garry      2016-08-24  1915  =

917d3bdaf8f2ab Xiaofei Tan     2017-08-11  1916  	if (unlikely(test_bit(HIS=
I_SAS_REJECT_CMD_BIT, &hisi_hba->flags)))
06ec0fb97c0281 Xiang Chen      2017-03-23  1917  		return -EINVAL;
06ec0fb97c0281 Xiang Chen      2017-03-23  1918  =

441c27401470c4 John Garry      2016-08-24  1919  	if (!device->port)
441c27401470c4 John Garry      2016-08-24  1920  		return -1;
441c27401470c4 John Garry      2016-08-24  1921  =

2e244f0f5bcaa9 John Garry      2017-03-23  1922  	port =3D to_hisi_sas_port=
(sas_port);
441c27401470c4 John Garry      2016-08-24  1923  =

0b5ae3c0eabfef Hannes Reinecke 2020-04-29  1924  	slot_idx =3D task->tag;
0b5ae3c0eabfef Hannes Reinecke 2020-04-29  1925  	if (task->tag =3D=3D -1)
0b5ae3c0eabfef Hannes Reinecke 2020-04-29  1926  		return -EAGAIN;
b1a49412f0aed7 Xiang Chen      2017-06-14  1927  =

3de0026dad6b8e Xiang Chen      2018-05-09  1928  	slot =3D &hisi_hba->slot_=
info[slot_idx];
fa222db0b03689 Xiang Chen      2018-05-09  1929  =

e9dc5e11c97ee9 Xiang Chen      2020-01-20  1930  	spin_lock(&dq->lock);
897cc769bcc092 John Garry      2019-08-05  1931  	wr_q_index =3D dq->wr_poi=
nt;
897cc769bcc092 John Garry      2019-08-05  1932  	dq->wr_point =3D (dq->wr_=
point + 1) % HISI_SAS_QUEUE_SLOTS;
fa222db0b03689 Xiang Chen      2018-05-09  1933  	list_add_tail(&slot->deli=
very, &dq->list);
e9dc5e11c97ee9 Xiang Chen      2020-01-20  1934  	spin_unlock(&dq->lock);
e9dc5e11c97ee9 Xiang Chen      2020-01-20  1935  	spin_lock(&sas_dev->lock);
4fefe5bbf599d6 Xiang Chen      2019-02-06  1936  	list_add_tail(&slot->entr=
y, &sas_dev->list);
e9dc5e11c97ee9 Xiang Chen      2020-01-20  1937  	spin_unlock(&sas_dev->loc=
k);
441c27401470c4 John Garry      2016-08-24  1938  =

b1a49412f0aed7 Xiang Chen      2017-06-14  1939  	dlvry_queue =3D dq->id;
fa222db0b03689 Xiang Chen      2018-05-09  1940  	dlvry_queue_slot =3D wr_q=
_index;
b1a49412f0aed7 Xiang Chen      2017-06-14  1941  =

4fefe5bbf599d6 Xiang Chen      2019-02-06  1942  	slot->device_id =3D sas_d=
ev->device_id;
441c27401470c4 John Garry      2016-08-24  1943  	slot->n_elem =3D n_elem;
441c27401470c4 John Garry      2016-08-24  1944  	slot->dlvry_queue =3D dlv=
ry_queue;
441c27401470c4 John Garry      2016-08-24  1945  	slot->dlvry_queue_slot =
=3D dlvry_queue_slot;
441c27401470c4 John Garry      2016-08-24  1946  	cmd_hdr_base =3D hisi_hba=
->cmd_hdr[dlvry_queue];
441c27401470c4 John Garry      2016-08-24  1947  	slot->cmd_hdr =3D &cmd_hd=
r_base[dlvry_queue_slot];
441c27401470c4 John Garry      2016-08-24  1948  	slot->task =3D task;
441c27401470c4 John Garry      2016-08-24  1949  	slot->port =3D port;
cd938e535e909b Xiang Chen      2018-05-02  1950  	slot->is_internal =3D tru=
e;
441c27401470c4 John Garry      2016-08-24  1951  	task->lldd_task =3D slot;
441c27401470c4 John Garry      2016-08-24  1952  =

441c27401470c4 John Garry      2016-08-24  1953  	memset(slot->cmd_hdr, 0, =
sizeof(struct hisi_sas_cmd_hdr));
031da09c110106 Xiang Chen      2017-08-11  1954  	memset(hisi_sas_cmd_hdr_a=
ddr_mem(slot), 0, HISI_SAS_COMMAND_TABLE_SZ);
d380f55503ed28 Xiang Chen      2019-08-05  1955  	memset(hisi_sas_status_bu=
f_addr_mem(slot), 0,
d380f55503ed28 Xiang Chen      2019-08-05  1956  	       sizeof(struct hisi=
_sas_err_record));
441c27401470c4 John Garry      2016-08-24  1957  =

a2b3820bddfbff Xiang Chen      2018-05-09  1958  	hisi_sas_task_prep_abort(=
hisi_hba, slot, device_id,
441c27401470c4 John Garry      2016-08-24  1959  				      abort_flag, task=
_tag);
441c27401470c4 John Garry      2016-08-24  1960  =

54c9dd2d26d095 John Garry      2017-03-23  1961  	spin_lock_irqsave(&task->=
task_state_lock, flags);
441c27401470c4 John Garry      2016-08-24  1962  	task->task_state_flags |=
=3D SAS_TASK_AT_INITIATOR;
54c9dd2d26d095 John Garry      2017-03-23  1963  	spin_unlock_irqrestore(&t=
ask->task_state_lock, flags);
1c09b663168bb5 Xiaofei Tan     2018-07-18  1964  	WRITE_ONCE(slot->ready, 1=
);
b1a49412f0aed7 Xiang Chen      2017-06-14  1965  	/* send abort command to =
the chip */
e9dc5e11c97ee9 Xiang Chen      2020-01-20  1966  	spin_lock(&dq->lock);
b1a49412f0aed7 Xiang Chen      2017-06-14  1967  	hisi_hba->hw->start_deliv=
ery(dq);
e9dc5e11c97ee9 Xiang Chen      2020-01-20  1968  	spin_unlock(&dq->lock);
441c27401470c4 John Garry      2016-08-24  1969  =

441c27401470c4 John Garry      2016-08-24  1970  	return 0;
441c27401470c4 John Garry      2016-08-24  1971  =

441c27401470c4 John Garry      2016-08-24 @1972  err_out:
441c27401470c4 John Garry      2016-08-24  1973  	dev_err(dev, "internal ab=
ort task prep: failed[%d]!\n", rc);
441c27401470c4 John Garry      2016-08-24  1974  =

441c27401470c4 John Garry      2016-08-24  1975  	return rc;
441c27401470c4 John Garry      2016-08-24  1976  }
441c27401470c4 John Garry      2016-08-24  1977  =


:::::: The code at line 1972 was first introduced by commit
:::::: 441c27401470c417cf4a33ab9c17bcefdf1ecca3 scsi: hisi_sas: add interna=
l abort main code

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4730982220704506149==--


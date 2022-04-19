Content-Type: multipart/mixed; boundary="===============0701231801613337821=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/libiscsi.c:1457 iscsi_xmit_task() warn: test_bit() takes a bit number
Date: Tue, 19 Apr 2022 10:23:48 +0800
Message-ID: <202204191024.rt0KFN40-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0701231801613337821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Lee Duncan <lduncan@suse.com>
CC: Chris Leech <cleech@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 5bd856256f8c03e329f8ff36d8c8efcb111fe6df scsi: iscsi: Merge suspend=
 fields
date:   7 days ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204191024.rt0KFN40-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/libiscsi.c:1457 iscsi_xmit_task() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:1535 iscsi_data_xmit() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:1749 iscsi_queuecommand() warn: test_bit() takes a =
bit number
drivers/scsi/bnx2i/bnx2i_hwi.c:1980 bnx2i_process_new_cqes() warn: test_bit=
() takes a bit number

Old smatch warnings:
drivers/scsi/libiscsi.c:1395 iscsi_set_conn_failed() warn: test_bit() takes=
 a bit number
drivers/scsi/libiscsi.c:1396 iscsi_set_conn_failed() warn: test_bit() takes=
 a bit number
drivers/scsi/libiscsi.c:1938 iscsi_suspend_queue() warn: test_bit() takes a=
 bit number
drivers/scsi/libiscsi.c:1956 iscsi_suspend_tx() warn: test_bit() takes a bi=
t number
drivers/scsi/libiscsi.c:1964 iscsi_start_tx() warn: test_bit() takes a bit =
number
drivers/scsi/libiscsi.c:3332 iscsi_conn_bind() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:3333 iscsi_conn_bind() warn: test_bit() takes a bit=
 number

vim +1457 drivers/scsi/libiscsi.c

77a23c21aaa723 Mike Christie   2007-05-30  1430  =

5923d64b7ab63d Mike Christie   2021-02-06  1431  static int iscsi_xmit_task=
(struct iscsi_conn *conn, struct iscsi_task *task,
5923d64b7ab63d Mike Christie   2021-02-06  1432  			   bool was_requeue)
77a23c21aaa723 Mike Christie   2007-05-30  1433  {
843c0a8a76078c Mike Christie   2007-12-13  1434  	int rc;
77a23c21aaa723 Mike Christie   2007-05-30  1435  =

79edd00dc6a966 Anoob Soman     2019-02-13  1436  	spin_lock_bh(&conn->sessi=
on->back_lock);
5923d64b7ab63d Mike Christie   2021-02-06  1437  =

5923d64b7ab63d Mike Christie   2021-02-06  1438  	if (!conn->task) {
5923d64b7ab63d Mike Christie   2021-02-06  1439  		/* Take a ref so we can =
access it after xmit_task() */
5923d64b7ab63d Mike Christie   2021-02-06  1440  		__iscsi_get_task(task);
5923d64b7ab63d Mike Christie   2021-02-06  1441  	} else {
5923d64b7ab63d Mike Christie   2021-02-06  1442  		/* Already have a ref fr=
om when we failed to send it last call */
5923d64b7ab63d Mike Christie   2021-02-06  1443  		conn->task =3D NULL;
5923d64b7ab63d Mike Christie   2021-02-06  1444  	}
5923d64b7ab63d Mike Christie   2021-02-06  1445  =

5923d64b7ab63d Mike Christie   2021-02-06  1446  	/*
5923d64b7ab63d Mike Christie   2021-02-06  1447  	 * If this was a requeue =
for a R2T we have an extra ref on the task in
5923d64b7ab63d Mike Christie   2021-02-06  1448  	 * case a bad target send=
s a cmd rsp before we have handled the task.
5923d64b7ab63d Mike Christie   2021-02-06  1449  	 */
5923d64b7ab63d Mike Christie   2021-02-06  1450  	if (was_requeue)
5923d64b7ab63d Mike Christie   2021-02-06  1451  		__iscsi_put_task(task);
5923d64b7ab63d Mike Christie   2021-02-06  1452  =

5923d64b7ab63d Mike Christie   2021-02-06  1453  	/*
5923d64b7ab63d Mike Christie   2021-02-06  1454  	 * Do this after dropping=
 the extra ref because if this was a requeue
5923d64b7ab63d Mike Christie   2021-02-06  1455  	 * it's removed from that=
 list and cleanup_queued_task would miss it.
5923d64b7ab63d Mike Christie   2021-02-06  1456  	 */
5bd856256f8c03 Mike Christie   2022-04-07 @1457  	if (test_bit(ISCSI_CONN_F=
LAG_SUSPEND_TX, &conn->flags)) {
5923d64b7ab63d Mike Christie   2021-02-06  1458  		/*
5923d64b7ab63d Mike Christie   2021-02-06  1459  		 * Save the task and ref=
 in case we weren't cleaning up this
5923d64b7ab63d Mike Christie   2021-02-06  1460  		 * task and get woken up=
 again.
5923d64b7ab63d Mike Christie   2021-02-06  1461  		 */
5923d64b7ab63d Mike Christie   2021-02-06  1462  		conn->task =3D task;
79edd00dc6a966 Anoob Soman     2019-02-13  1463  		spin_unlock_bh(&conn->se=
ssion->back_lock);
79edd00dc6a966 Anoob Soman     2019-02-13  1464  		return -ENODATA;
79edd00dc6a966 Anoob Soman     2019-02-13  1465  	}
79edd00dc6a966 Anoob Soman     2019-02-13  1466  	spin_unlock_bh(&conn->ses=
sion->back_lock);
5923d64b7ab63d Mike Christie   2021-02-06  1467  =

659743b02c4110 Shlomo Pongratz 2014-02-07  1468  	spin_unlock_bh(&conn->ses=
sion->frwd_lock);
9c19a7d0387124 Mike Christie   2008-05-21  1469  	rc =3D conn->session->tt-=
>xmit_task(task);
659743b02c4110 Shlomo Pongratz 2014-02-07  1470  	spin_lock_bh(&conn->sessi=
on->frwd_lock);
d355e57d58193b Mike Christie   2009-06-15  1471  	if (!rc) {
9c19a7d0387124 Mike Christie   2008-05-21  1472  		/* done with this task */
d355e57d58193b Mike Christie   2009-06-15  1473  		task->last_xfer =3D jiff=
ies;
d355e57d58193b Mike Christie   2009-06-15  1474  	}
659743b02c4110 Shlomo Pongratz 2014-02-07  1475  	/* regular RX path uses b=
ack_lock */
72b9740201d5f0 Shlomo Pongratz 2014-03-30  1476  	spin_lock(&conn->session-=
>back_lock);
5923d64b7ab63d Mike Christie   2021-02-06  1477  	if (rc && task->state =3D=
=3D ISCSI_TASK_RUNNING) {
5923d64b7ab63d Mike Christie   2021-02-06  1478  		/*
5923d64b7ab63d Mike Christie   2021-02-06  1479  		 * get an extra ref that=
 is released next time we access it
5923d64b7ab63d Mike Christie   2021-02-06  1480  		 * as conn->task above.
5923d64b7ab63d Mike Christie   2021-02-06  1481  		 */
5923d64b7ab63d Mike Christie   2021-02-06  1482  		__iscsi_get_task(task);
5923d64b7ab63d Mike Christie   2021-02-06  1483  		conn->task =3D task;
5923d64b7ab63d Mike Christie   2021-02-06  1484  	}
5923d64b7ab63d Mike Christie   2021-02-06  1485  =

d355e57d58193b Mike Christie   2009-06-15  1486  	__iscsi_put_task(task);
72b9740201d5f0 Shlomo Pongratz 2014-03-30  1487  	spin_unlock(&conn->sessio=
n->back_lock);
77a23c21aaa723 Mike Christie   2007-05-30  1488  	return rc;
77a23c21aaa723 Mike Christie   2007-05-30  1489  }
77a23c21aaa723 Mike Christie   2007-05-30  1490  =

843c0a8a76078c Mike Christie   2007-12-13  1491  /**
9c19a7d0387124 Mike Christie   2008-05-21  1492   * iscsi_requeue_task - re=
queue task to run from session workqueue
9c19a7d0387124 Mike Christie   2008-05-21  1493   * @task: task to requeue
843c0a8a76078c Mike Christie   2007-12-13  1494   *
5923d64b7ab63d Mike Christie   2021-02-06  1495   * Callers must have taken=
 a ref to the task that is going to be requeued.
843c0a8a76078c Mike Christie   2007-12-13  1496   */
9c19a7d0387124 Mike Christie   2008-05-21  1497  void iscsi_requeue_task(st=
ruct iscsi_task *task)
843c0a8a76078c Mike Christie   2007-12-13  1498  {
9c19a7d0387124 Mike Christie   2008-05-21  1499  	struct iscsi_conn *conn =
=3D task->conn;
843c0a8a76078c Mike Christie   2007-12-13  1500  =

3bbaaad95fd38d Mike Christie   2009-05-13  1501  	/*
3bbaaad95fd38d Mike Christie   2009-05-13  1502  	 * this may be on the req=
ueue list already if the xmit_task callout
3bbaaad95fd38d Mike Christie   2009-05-13  1503  	 * is handling the r2ts w=
hile we are adding new ones
3bbaaad95fd38d Mike Christie   2009-05-13  1504  	 */
5923d64b7ab63d Mike Christie   2021-02-06  1505  	spin_lock_bh(&conn->sessi=
on->frwd_lock);
5923d64b7ab63d Mike Christie   2021-02-06  1506  	if (list_empty(&task->run=
ning)) {
3bbaaad95fd38d Mike Christie   2009-05-13  1507  		list_add_tail(&task->run=
ning, &conn->requeue);
5923d64b7ab63d Mike Christie   2021-02-06  1508  	} else {
5923d64b7ab63d Mike Christie   2021-02-06  1509  		/*
5923d64b7ab63d Mike Christie   2021-02-06  1510  		 * Don't need the extra =
ref since it's already requeued and
5923d64b7ab63d Mike Christie   2021-02-06  1511  		 * has a ref.
5923d64b7ab63d Mike Christie   2021-02-06  1512  		 */
5923d64b7ab63d Mike Christie   2021-02-06  1513  		iscsi_put_task(task);
5923d64b7ab63d Mike Christie   2021-02-06  1514  	}
32ae763e3fce41 Mike Christie   2009-03-05  1515  	iscsi_conn_queue_work(con=
n);
5923d64b7ab63d Mike Christie   2021-02-06  1516  	spin_unlock_bh(&conn->ses=
sion->frwd_lock);
843c0a8a76078c Mike Christie   2007-12-13  1517  }
9c19a7d0387124 Mike Christie   2008-05-21  1518  EXPORT_SYMBOL_GPL(iscsi_re=
queue_task);
843c0a8a76078c Mike Christie   2007-12-13  1519  =

7996a778ff8c71 Mike Christie   2006-04-06  1520  /**
7996a778ff8c71 Mike Christie   2006-04-06  1521   * iscsi_data_xmit - xmit =
any command into the scheduled connection
7996a778ff8c71 Mike Christie   2006-04-06  1522   * @conn: iscsi connection
7996a778ff8c71 Mike Christie   2006-04-06  1523   *
7996a778ff8c71 Mike Christie   2006-04-06  1524   * Notes:
7996a778ff8c71 Mike Christie   2006-04-06  1525   *	The function can return=
 -EAGAIN in which case the caller must
7996a778ff8c71 Mike Christie   2006-04-06  1526   *	re-schedule it again la=
ter or recover. '0' return code means
7996a778ff8c71 Mike Christie   2006-04-06  1527   *	successful xmit.
7996a778ff8c71 Mike Christie   2006-04-06  1528   **/
7996a778ff8c71 Mike Christie   2006-04-06  1529  static int iscsi_data_xmit=
(struct iscsi_conn *conn)
7996a778ff8c71 Mike Christie   2006-04-06  1530  {
5d12c05e29fc87 Mike Christie   2009-11-11  1531  	struct iscsi_task *task;
3219e5294150ae Mike Christie   2006-05-30  1532  	int rc =3D 0;
7996a778ff8c71 Mike Christie   2006-04-06  1533  =

659743b02c4110 Shlomo Pongratz 2014-02-07  1534  	spin_lock_bh(&conn->sessi=
on->frwd_lock);
5bd856256f8c03 Mike Christie   2022-04-07 @1535  	if (test_bit(ISCSI_CONN_F=
LAG_SUSPEND_TX, &conn->flags)) {
1b2c7af877f427 Mike Christie   2009-03-05  1536  		ISCSI_DBG_SESSION(conn->=
session, "Tx suspended!\n");
659743b02c4110 Shlomo Pongratz 2014-02-07  1537  		spin_unlock_bh(&conn->se=
ssion->frwd_lock);
3219e5294150ae Mike Christie   2006-05-30  1538  		return -ENODATA;
7996a778ff8c71 Mike Christie   2006-04-06  1539  	}
7996a778ff8c71 Mike Christie   2006-04-06  1540  =

9c19a7d0387124 Mike Christie   2008-05-21  1541  	if (conn->task) {
5923d64b7ab63d Mike Christie   2021-02-06  1542  		rc =3D iscsi_xmit_task(c=
onn, conn->task, false);
3219e5294150ae Mike Christie   2006-05-30  1543  	        if (rc)
70b31c152dc49e Mike Christie   2009-08-20  1544  		        goto done;
7996a778ff8c71 Mike Christie   2006-04-06  1545  	}
77a23c21aaa723 Mike Christie   2007-05-30  1546  =

77a23c21aaa723 Mike Christie   2007-05-30  1547  	/*
77a23c21aaa723 Mike Christie   2007-05-30  1548  	 * process mgmt pdus like=
 nops before commands since we should
77a23c21aaa723 Mike Christie   2007-05-30  1549  	 * only have one nop-out =
as a ping from us and targets should not
77a23c21aaa723 Mike Christie   2007-05-30  1550  	 * overflow us with nop-i=
ns
77a23c21aaa723 Mike Christie   2007-05-30  1551  	 */
77a23c21aaa723 Mike Christie   2007-05-30  1552  check_mgmt:
843c0a8a76078c Mike Christie   2007-12-13  1553  	while (!list_empty(&conn-=
>mgmtqueue)) {
5923d64b7ab63d Mike Christie   2021-02-06  1554  		task =3D list_entry(conn=
->mgmtqueue.next, struct iscsi_task,
5923d64b7ab63d Mike Christie   2021-02-06  1555  				  running);
5923d64b7ab63d Mike Christie   2021-02-06  1556  		list_del_init(&task->run=
ning);
5923d64b7ab63d Mike Christie   2021-02-06  1557  		if (iscsi_prep_mgmt_task=
(conn, task)) {
659743b02c4110 Shlomo Pongratz 2014-02-07  1558  			/* regular RX path uses=
 back_lock */
659743b02c4110 Shlomo Pongratz 2014-02-07  1559  			spin_lock_bh(&conn->ses=
sion->back_lock);
5923d64b7ab63d Mike Christie   2021-02-06  1560  			__iscsi_put_task(task);
659743b02c4110 Shlomo Pongratz 2014-02-07  1561  			spin_unlock_bh(&conn->s=
ession->back_lock);
b3a7ea8d50f602 Mike Christie   2007-12-13  1562  			continue;
b3a7ea8d50f602 Mike Christie   2007-12-13  1563  		}
5923d64b7ab63d Mike Christie   2021-02-06  1564  		rc =3D iscsi_xmit_task(c=
onn, task, false);
3219e5294150ae Mike Christie   2006-05-30  1565  		if (rc)
70b31c152dc49e Mike Christie   2009-08-20  1566  			goto done;
7996a778ff8c71 Mike Christie   2006-04-06  1567  	}
7996a778ff8c71 Mike Christie   2006-04-06  1568  =

843c0a8a76078c Mike Christie   2007-12-13  1569  	/* process pending comman=
d queue */
3bbaaad95fd38d Mike Christie   2009-05-13  1570  	while (!list_empty(&conn-=
>cmdqueue)) {
5923d64b7ab63d Mike Christie   2021-02-06  1571  		task =3D list_entry(conn=
->cmdqueue.next, struct iscsi_task,
5d12c05e29fc87 Mike Christie   2009-11-11  1572  				  running);
5923d64b7ab63d Mike Christie   2021-02-06  1573  		list_del_init(&task->run=
ning);
b3a7ea8d50f602 Mike Christie   2007-12-13  1574  		if (conn->session->state=
 =3D=3D ISCSI_STATE_LOGGING_OUT) {
5923d64b7ab63d Mike Christie   2021-02-06  1575  			fail_scsi_task(task, DI=
D_IMM_RETRY);
b3a7ea8d50f602 Mike Christie   2007-12-13  1576  			continue;
b3a7ea8d50f602 Mike Christie   2007-12-13  1577  		}
5923d64b7ab63d Mike Christie   2021-02-06  1578  		rc =3D iscsi_prep_scsi_c=
md_pdu(task);
577577da6d197e Mike Christie   2008-12-02  1579  		if (rc) {
d28d48c6997799 Mike Christie   2021-02-06  1580  			if (rc =3D=3D -ENOMEM |=
| rc =3D=3D -EACCES)
5923d64b7ab63d Mike Christie   2021-02-06  1581  				fail_scsi_task(task, D=
ID_IMM_RETRY);
d28d48c6997799 Mike Christie   2021-02-06  1582  			else
5923d64b7ab63d Mike Christie   2021-02-06  1583  				fail_scsi_task(task, D=
ID_ABORT);
004d6530f83bee Boaz Harrosh    2007-12-13  1584  			continue;
004d6530f83bee Boaz Harrosh    2007-12-13  1585  		}
5923d64b7ab63d Mike Christie   2021-02-06  1586  		rc =3D iscsi_xmit_task(c=
onn, task, false);
3219e5294150ae Mike Christie   2006-05-30  1587  		if (rc)
70b31c152dc49e Mike Christie   2009-08-20  1588  			goto done;
77a23c21aaa723 Mike Christie   2007-05-30  1589  		/*
9c19a7d0387124 Mike Christie   2008-05-21  1590  		 * we could continuously=
 get new task requests so
77a23c21aaa723 Mike Christie   2007-05-30  1591  		 * we need to check the =
mgmt queue for nops that need to
77a23c21aaa723 Mike Christie   2007-05-30  1592  		 * be sent to aviod star=
vation
77a23c21aaa723 Mike Christie   2007-05-30  1593  		 */
843c0a8a76078c Mike Christie   2007-12-13  1594  		if (!list_empty(&conn->m=
gmtqueue))
843c0a8a76078c Mike Christie   2007-12-13  1595  			goto check_mgmt;
843c0a8a76078c Mike Christie   2007-12-13  1596  	}
843c0a8a76078c Mike Christie   2007-12-13  1597  =

843c0a8a76078c Mike Christie   2007-12-13  1598  	while (!list_empty(&conn-=
>requeue)) {
b3a7ea8d50f602 Mike Christie   2007-12-13  1599  		/*
b3a7ea8d50f602 Mike Christie   2007-12-13  1600  		 * we always do fastlogo=
ut - conn stop code will clean up.
b3a7ea8d50f602 Mike Christie   2007-12-13  1601  		 */
b3a7ea8d50f602 Mike Christie   2007-12-13  1602  		if (conn->session->state=
 =3D=3D ISCSI_STATE_LOGGING_OUT)
b3a7ea8d50f602 Mike Christie   2007-12-13  1603  			break;
b3a7ea8d50f602 Mike Christie   2007-12-13  1604  =

5d12c05e29fc87 Mike Christie   2009-11-11  1605  		task =3D list_entry(conn=
->requeue.next, struct iscsi_task,
5d12c05e29fc87 Mike Christie   2009-11-11  1606  				  running);
5923d64b7ab63d Mike Christie   2021-02-06  1607  =

5d12c05e29fc87 Mike Christie   2009-11-11  1608  		if (iscsi_check_tmf_rest=
rictions(task, ISCSI_OP_SCSI_DATA_OUT))
5d12c05e29fc87 Mike Christie   2009-11-11  1609  			break;
5d12c05e29fc87 Mike Christie   2009-11-11  1610  =

5923d64b7ab63d Mike Christie   2021-02-06  1611  		list_del_init(&task->run=
ning);
5923d64b7ab63d Mike Christie   2021-02-06  1612  		rc =3D iscsi_xmit_task(c=
onn, task, true);
843c0a8a76078c Mike Christie   2007-12-13  1613  		if (rc)
70b31c152dc49e Mike Christie   2009-08-20  1614  			goto done;
843c0a8a76078c Mike Christie   2007-12-13  1615  		if (!list_empty(&conn->m=
gmtqueue))
77a23c21aaa723 Mike Christie   2007-05-30  1616  			goto check_mgmt;
7996a778ff8c71 Mike Christie   2006-04-06  1617  	}
659743b02c4110 Shlomo Pongratz 2014-02-07  1618  	spin_unlock_bh(&conn->ses=
sion->frwd_lock);
3219e5294150ae Mike Christie   2006-05-30  1619  	return -ENODATA;
7996a778ff8c71 Mike Christie   2006-04-06  1620  =

70b31c152dc49e Mike Christie   2009-08-20  1621  done:
659743b02c4110 Shlomo Pongratz 2014-02-07  1622  	spin_unlock_bh(&conn->ses=
sion->frwd_lock);
3219e5294150ae Mike Christie   2006-05-30  1623  	return rc;
7996a778ff8c71 Mike Christie   2006-04-06  1624  }
7996a778ff8c71 Mike Christie   2006-04-06  1625  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0701231801613337821==--


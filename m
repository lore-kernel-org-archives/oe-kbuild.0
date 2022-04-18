Content-Type: multipart/mixed; boundary="===============5045681758836575493=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/libiscsi.c:682 __iscsi_conn_send_pdu() warn: test_bit() takes a bit number
Date: Mon, 18 Apr 2022 18:13:19 +0800
Message-ID: <202204181822.wuWQfQdm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5045681758836575493==
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
commit: 44ac97109e42f87b1a34954704b81b6c8eca80c4 scsi: iscsi: Fix NOP handl=
ing during conn recovery
date:   6 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204181822.wuWQfQdm-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/libiscsi.c:682 __iscsi_conn_send_pdu() warn: test_bit() takes =
a bit number

Old smatch warnings:
drivers/scsi/libiscsi.c:1396 iscsi_set_conn_failed() warn: test_bit() takes=
 a bit number
drivers/scsi/libiscsi.c:1397 iscsi_set_conn_failed() warn: test_bit() takes=
 a bit number
drivers/scsi/libiscsi.c:1458 iscsi_xmit_task() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:1536 iscsi_data_xmit() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:1750 iscsi_queuecommand() warn: test_bit() takes a =
bit number
drivers/scsi/libiscsi.c:1939 iscsi_suspend_queue() warn: test_bit() takes a=
 bit number
drivers/scsi/libiscsi.c:1957 iscsi_suspend_tx() warn: test_bit() takes a bi=
t number
drivers/scsi/libiscsi.c:1965 iscsi_start_tx() warn: test_bit() takes a bit =
number
drivers/scsi/libiscsi.c:2218 iscsi_conn_unbind() warn: test_bit() takes a b=
it number
drivers/scsi/libiscsi.c:3324 iscsi_conn_bind() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:3337 iscsi_conn_bind() warn: test_bit() takes a bit=
 number
drivers/scsi/libiscsi.c:3338 iscsi_conn_bind() warn: test_bit() takes a bit=
 number

vim +682 drivers/scsi/libiscsi.c

052d014485d2ce Mike Christie    2008-05-21  670  =

9c19a7d0387124 Mike Christie    2008-05-21  671  static struct iscsi_task *
f6d5180c78780d Mike Christie    2007-12-13  672  __iscsi_conn_send_pdu(stru=
ct iscsi_conn *conn, struct iscsi_hdr *hdr,
f6d5180c78780d Mike Christie    2007-12-13  673  		      char *data, uint32=
_t data_size)
f6d5180c78780d Mike Christie    2007-12-13  674  {
f6d5180c78780d Mike Christie    2007-12-13  675  	struct iscsi_session *ses=
sion =3D conn->session;
1336aed10b8af7 Mike Christie    2009-05-13  676  	struct iscsi_host *ihost =
=3D shost_priv(session->host);
4f704dc0329740 Mike Christie    2009-11-11  677  	uint8_t opcode =3D hdr->o=
pcode & ISCSI_OPCODE_MASK;
9c19a7d0387124 Mike Christie    2008-05-21  678  	struct iscsi_task *task;
262ef63627977a Mike Christie    2008-12-02  679  	itt_t itt;
f6d5180c78780d Mike Christie    2007-12-13  680  =

44ac97109e42f8 Mike Christie    2022-04-07  681  	if (session->state =3D=3D=
 ISCSI_STATE_TERMINATE ||
44ac97109e42f8 Mike Christie    2022-04-07 @682  	    !test_bit(ISCSI_CONN_=
FLAG_BOUND, &conn->flags))
f6d5180c78780d Mike Christie    2007-12-13  683  		return NULL;
f6d5180c78780d Mike Christie    2007-12-13  684  =

4f704dc0329740 Mike Christie    2009-11-11  685  	if (opcode =3D=3D ISCSI_O=
P_LOGIN || opcode =3D=3D ISCSI_OP_TEXT) {
f6d5180c78780d Mike Christie    2007-12-13  686  		/*
f6d5180c78780d Mike Christie    2007-12-13  687  		 * Login and Text are se=
nt serially, in
f6d5180c78780d Mike Christie    2007-12-13  688  		 * request-followed-by-r=
esponse sequence.
3e5c28ad039138 Mike Christie    2008-05-21  689  		 * Same task can be used=
. Same ITT must be used.
3e5c28ad039138 Mike Christie    2008-05-21  690  		 * Note that login_task =
is preallocated at conn_create().
f6d5180c78780d Mike Christie    2007-12-13  691  		 */
4f704dc0329740 Mike Christie    2009-11-11  692  		if (conn->login_task->st=
ate !=3D ISCSI_TASK_FREE) {
4f704dc0329740 Mike Christie    2009-11-11  693  			iscsi_conn_printk(KERN_=
ERR, conn, "Login/Text in "
4f704dc0329740 Mike Christie    2009-11-11  694  					  "progress. Cannot s=
tart new task.\n");
4f704dc0329740 Mike Christie    2009-11-11  695  			return NULL;
4f704dc0329740 Mike Christie    2009-11-11  696  		}
4f704dc0329740 Mike Christie    2009-11-11  697  =

cbaa42213461e9 Mike Christie    2014-09-03  698  		if (data_size > ISCSI_DE=
F_MAX_RECV_SEG_LEN) {
cbaa42213461e9 Mike Christie    2014-09-03  699  			iscsi_conn_printk(KERN_=
ERR, conn, "Invalid buffer len of %u for login task. Max len is %u\n", data=
_size, ISCSI_DEF_MAX_RECV_SEG_LEN);
cbaa42213461e9 Mike Christie    2014-09-03  700  			return NULL;
cbaa42213461e9 Mike Christie    2014-09-03  701  		}
cbaa42213461e9 Mike Christie    2014-09-03  702  =

9c19a7d0387124 Mike Christie    2008-05-21  703  		task =3D conn->login_tas=
k;
4f704dc0329740 Mike Christie    2009-11-11  704  	} else {
26013ad4c43f49 Mike Christie    2009-05-13  705  		if (session->state !=3D =
ISCSI_STATE_LOGGED_IN)
26013ad4c43f49 Mike Christie    2009-05-13  706  			return NULL;
26013ad4c43f49 Mike Christie    2009-05-13  707  =

cbaa42213461e9 Mike Christie    2014-09-03  708  		if (data_size !=3D 0) {
cbaa42213461e9 Mike Christie    2014-09-03  709  			iscsi_conn_printk(KERN_=
ERR, conn, "Can not send data buffer of len %u for op 0x%x\n", data_size, o=
pcode);
cbaa42213461e9 Mike Christie    2014-09-03  710  			return NULL;
cbaa42213461e9 Mike Christie    2014-09-03  711  		}
cbaa42213461e9 Mike Christie    2014-09-03  712  =

f6d5180c78780d Mike Christie    2007-12-13  713  		BUG_ON(conn->c_stage =3D=
=3D ISCSI_CONN_INITIAL_STAGE);
f6d5180c78780d Mike Christie    2007-12-13  714  		BUG_ON(conn->c_stage =3D=
=3D ISCSI_CONN_STOPPED);
f6d5180c78780d Mike Christie    2007-12-13  715  =

7acd72eb85f1c7 Stefani Seibold  2009-12-21  716  		if (!kfifo_out(&session-=
>cmdpool.queue,
9c19a7d0387124 Mike Christie    2008-05-21  717  				 (void*)&task, sizeof(=
void*)))
f6d5180c78780d Mike Christie    2007-12-13  718  			return NULL;
f6d5180c78780d Mike Christie    2007-12-13  719  	}
3e5c28ad039138 Mike Christie    2008-05-21  720  	/*
3e5c28ad039138 Mike Christie    2008-05-21  721  	 * released in complete p=
du for task we expect a response for, and
3e5c28ad039138 Mike Christie    2008-05-21  722  	 * released by the lld wh=
en it has transmitted the task for
3e5c28ad039138 Mike Christie    2008-05-21  723  	 * pdus we do not expect =
a response for.
3e5c28ad039138 Mike Christie    2008-05-21  724  	 */
6dc618cdd6b896 Elena Reshetova  2017-03-09  725  	refcount_set(&task->refco=
unt, 1);
9c19a7d0387124 Mike Christie    2008-05-21  726  	task->conn =3D conn;
9c19a7d0387124 Mike Christie    2008-05-21  727  	task->sc =3D NULL;
3bbaaad95fd38d Mike Christie    2009-05-13  728  	INIT_LIST_HEAD(&task->run=
ning);
3bbaaad95fd38d Mike Christie    2009-05-13  729  	task->state =3D ISCSI_TAS=
K_PENDING;
f6d5180c78780d Mike Christie    2007-12-13  730  =

f6d5180c78780d Mike Christie    2007-12-13  731  	if (data_size) {
9c19a7d0387124 Mike Christie    2008-05-21  732  		memcpy(task->data, data,=
 data_size);
9c19a7d0387124 Mike Christie    2008-05-21  733  		task->data_count =3D dat=
a_size;
f6d5180c78780d Mike Christie    2007-12-13  734  	} else
9c19a7d0387124 Mike Christie    2008-05-21  735  		task->data_count =3D 0;
f6d5180c78780d Mike Christie    2007-12-13  736  =

184b57c630c86d Mike Christie    2009-05-13  737  	if (conn->session->tt->al=
loc_pdu) {
2ff79d52d56eeb Mike Christie    2008-12-02  738  		if (conn->session->tt->a=
lloc_pdu(task, hdr->opcode)) {
577577da6d197e Mike Christie    2008-12-02  739  			iscsi_conn_printk(KERN_=
ERR, conn, "Could not allocate "
577577da6d197e Mike Christie    2008-12-02  740  					 "pdu for mgmt task.\=
n");
3bbaaad95fd38d Mike Christie    2009-05-13  741  			goto free_task;
577577da6d197e Mike Christie    2008-12-02  742  		}
184b57c630c86d Mike Christie    2009-05-13  743  	}
184b57c630c86d Mike Christie    2009-05-13  744  =

262ef63627977a Mike Christie    2008-12-02  745  	itt =3D task->hdr->itt;
577577da6d197e Mike Christie    2008-12-02  746  	task->hdr_len =3D sizeof(=
struct iscsi_hdr);
9c19a7d0387124 Mike Christie    2008-05-21  747  	memcpy(task->hdr, hdr, si=
zeof(struct iscsi_hdr));
262ef63627977a Mike Christie    2008-12-02  748  =

262ef63627977a Mike Christie    2008-12-02  749  	if (hdr->itt !=3D RESERVE=
D_ITT) {
262ef63627977a Mike Christie    2008-12-02  750  		if (session->tt->parse_p=
du_itt)
262ef63627977a Mike Christie    2008-12-02  751  			task->hdr->itt =3D itt;
262ef63627977a Mike Christie    2008-12-02  752  		else
262ef63627977a Mike Christie    2008-12-02  753  			task->hdr->itt =3D buil=
d_itt(task->itt,
262ef63627977a Mike Christie    2008-12-02  754  						   task->conn->sessi=
on->age);
262ef63627977a Mike Christie    2008-12-02  755  	}
262ef63627977a Mike Christie    2008-12-02  756  =

fe0a8a95e7134d Lee Duncan       2020-11-06  757  	if (unlikely(READ_ONCE(co=
nn->ping_task) =3D=3D INVALID_SCSI_TASK))
fe0a8a95e7134d Lee Duncan       2020-11-06  758  		WRITE_ONCE(conn->ping_ta=
sk, task);
fe0a8a95e7134d Lee Duncan       2020-11-06  759  =

1336aed10b8af7 Mike Christie    2009-05-13  760  	if (!ihost->workq) {
577577da6d197e Mike Christie    2008-12-02  761  		if (iscsi_prep_mgmt_task=
(conn, task))
577577da6d197e Mike Christie    2008-12-02  762  			goto free_task;
052d014485d2ce Mike Christie    2008-05-21  763  =

9c19a7d0387124 Mike Christie    2008-05-21  764  		if (session->tt->xmit_ta=
sk(task))
577577da6d197e Mike Christie    2008-12-02  765  			goto free_task;
3bbaaad95fd38d Mike Christie    2009-05-13  766  	} else {
3bbaaad95fd38d Mike Christie    2009-05-13  767  		list_add_tail(&task->run=
ning, &conn->mgmtqueue);
32ae763e3fce41 Mike Christie    2009-03-05  768  		iscsi_conn_queue_work(co=
nn);
3bbaaad95fd38d Mike Christie    2009-05-13  769  	}
052d014485d2ce Mike Christie    2008-05-21  770  =

9c19a7d0387124 Mike Christie    2008-05-21  771  	return task;
577577da6d197e Mike Christie    2008-12-02  772  =

577577da6d197e Mike Christie    2008-12-02  773  free_task:
659743b02c4110 Shlomo Pongratz  2014-02-07  774  	/* regular RX path uses b=
ack_lock */
4fa507992f0a10 Jitendra Bhivare 2016-10-13  775  	spin_lock(&session->back_=
lock);
577577da6d197e Mike Christie    2008-12-02  776  	__iscsi_put_task(task);
4fa507992f0a10 Jitendra Bhivare 2016-10-13  777  	spin_unlock(&session->bac=
k_lock);
577577da6d197e Mike Christie    2008-12-02  778  	return NULL;
f6d5180c78780d Mike Christie    2007-12-13  779  }
f6d5180c78780d Mike Christie    2007-12-13  780  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5045681758836575493==--


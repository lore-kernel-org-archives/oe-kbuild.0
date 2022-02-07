Content-Type: multipart/mixed; boundary="===============5676981002044081738=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cifs:tmp-mchan-branch 14/21] fs/cifs/smb2pdu.c:3869:17-20: ERROR: invalid reference to the index variable of the iterator on line 3809
Date: Mon, 07 Feb 2022 13:56:29 +0800
Message-ID: <202202071300.p4iFiNQU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5676981002044081738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-cifs(a)vger.kernel.org
CC: samba-technical(a)lists.samba.org
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git tmp-mchan-branch
head:   5dcedd487447680668c095add4b24432a06b2644
commit: 81b88cd97eb7df45d283a92b56603f6e433a69b5 [14/21] cifs: check reconn=
ects for channels of active tcons too
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220207/202202071300.p4iFiNQU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/cifs/smb2pdu.c:3869:17-20: ERROR: invalid reference to the index vari=
able of the iterator on line 3809

vim +3869 fs/cifs/smb2pdu.c

9094fad1ed90ca Pavel Shilovsky  2012-07-12  3784  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3785  void smb2_reconnect_serve=
r(struct work_struct *work)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3786  {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3787  	struct TCP_Server_Info *=
server =3D container_of(work,
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3788  					struct TCP_Server_In=
fo, reconnect.work);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3789  	struct TCP_Server_Info *=
pserver;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3790  	struct cifs_ses *ses, *s=
es2;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3791  	struct cifs_tcon *tcon, =
*tcon2;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3792  	struct list_head tmp_lis=
t, tmp_ses_list;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3793  	bool tcon_exist =3D fals=
e, ses_exist =3D false;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3794  	bool tcon_selected =3D f=
alse, ses_selected =3D false;
18ea43113f5b74 Germano Percossi 2017-04-07  3795  	int rc;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3796  	bool resched =3D false;
18ea43113f5b74 Germano Percossi 2017-04-07  3797  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3798  	/* If server is a channe=
l, select the primary channel */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3799  	pserver =3D CIFS_SERVER_=
IS_CHAN(server) ? server->primary_server : server;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3800  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3801  	/* Prevent simultaneous =
reconnects that can corrupt tcon->rlist list */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3802  	mutex_lock(&pserver->rec=
onnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3803  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3804  	INIT_LIST_HEAD(&tmp_list=
);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3805  	INIT_LIST_HEAD(&tmp_ses_=
list);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3806  	cifs_dbg(FYI, "Reconnect=
ing tcons and channels\n");
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3807  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3808  	spin_lock(&cifs_tcp_ses_=
lock);
81b88cd97eb7df Shyam Prasad N   2021-10-30 @3809  	list_for_each_entry(ses,=
 &pserver->smb_ses_list, smb_ses_list) {
81b88cd97eb7df Shyam Prasad N   2021-10-30  3810  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3811  		tcon_selected =3D ses_s=
elected =3D false;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3812  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3813  		list_for_each_entry(tco=
n, &ses->tcon_list, tcon_list) {
96a988ffeb90db Pavel Shilovsky  2016-11-29  3814  			if (tcon->need_reconne=
ct || tcon->need_reopen_files) {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3815  				tcon->tc_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3816  				list_add_tail(&tcon->=
rlist, &tmp_list);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3817  				tcon_selected =3D tco=
n_exist =3D true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3818  			}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3819  		}
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3820  		/*
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3821  		 * IPC has the same lif=
etime as its session and uses its
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3822  		 * refcount.
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3823  		 */
b327a717e50698 Aurelien Aptel   2018-01-24  3824  		if (ses->tcon_ipc && se=
s->tcon_ipc->need_reconnect) {
b327a717e50698 Aurelien Aptel   2018-01-24  3825  			list_add_tail(&ses->tc=
on_ipc->rlist, &tmp_list);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3826  			tcon_selected =3D tcon=
_exist =3D true;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3827  			ses->ses_count++;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3828  		}
81b88cd97eb7df Shyam Prasad N   2021-10-30  3829  		/*
81b88cd97eb7df Shyam Prasad N   2021-10-30  3830  		 * handle the case wher=
e channel needs to reconnect
81b88cd97eb7df Shyam Prasad N   2021-10-30  3831  		 * binding session, but=
 tcon is healthy (some other channel
81b88cd97eb7df Shyam Prasad N   2021-10-30  3832  		 * is active)
81b88cd97eb7df Shyam Prasad N   2021-10-30  3833  		 */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3834  		if (!tcon_selected && c=
ifs_chan_needs_reconnect(ses, server)) {
81b88cd97eb7df Shyam Prasad N   2021-10-30  3835  			list_add_tail(&ses->rl=
ist, &tmp_ses_list);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3836  			ses_selected =3D ses_e=
xist =3D true;
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3837  			ses->ses_count++;
b327a717e50698 Aurelien Aptel   2018-01-24  3838  		}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3839  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3840  	/*
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3841  	 * Get the reference to =
server struct to be sure that the last call of
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3842  	 * cifs_put_tcon() in th=
e loop below won't release the server pointer.
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3843  	 */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3844  	if (tcon_exist || ses_ex=
ist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3845  		server->srv_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3846  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3847  	spin_unlock(&cifs_tcp_se=
s_lock);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3848  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3849  	list_for_each_entry_safe=
(tcon, tcon2, &tmp_list, rlist) {
352d96f3acc6e0 Aurelien Aptel   2020-05-31  3850  		rc =3D smb2_reconnect(S=
MB2_INTERNAL_CMD, tcon, server);
18ea43113f5b74 Germano Percossi 2017-04-07  3851  		if (!rc)
96a988ffeb90db Pavel Shilovsky  2016-11-29  3852  			cifs_reopen_persistent=
_handles(tcon);
18ea43113f5b74 Germano Percossi 2017-04-07  3853  		else
18ea43113f5b74 Germano Percossi 2017-04-07  3854  			resched =3D true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3855  		list_del_init(&tcon->rl=
ist);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3856  		if (tcon->ipc)
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3857  			cifs_put_smb_ses(tcon-=
>ses);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3858  		else
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3859  			cifs_put_tcon(tcon);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3860  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3861  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3862  	if (!ses_exist)
81b88cd97eb7df Shyam Prasad N   2021-10-30  3863  		goto done;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3864  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3865  	/* allocate a dummy tcon=
 struct used for reconnect */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3866  	tcon =3D kzalloc(sizeof(=
struct cifs_tcon), GFP_KERNEL);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3867  	if (!tcon) {
81b88cd97eb7df Shyam Prasad N   2021-10-30  3868  		resched =3D true;
81b88cd97eb7df Shyam Prasad N   2021-10-30 @3869  		list_del_init(&ses->rli=
st);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3870  		cifs_put_smb_ses(ses);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3871  		goto done;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3872  	}
81b88cd97eb7df Shyam Prasad N   2021-10-30  3873  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3874  	tcon->tidStatus =3D Cifs=
Good;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3875  	tcon->retry =3D false;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3876  	tcon->need_reconnect =3D=
 false;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3877  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3878  	/* now reconnect session=
s for necessary channels */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3879  	list_for_each_entry_safe=
(ses, ses2, &tmp_ses_list, rlist) {
81b88cd97eb7df Shyam Prasad N   2021-10-30  3880  		tcon->ses =3D ses;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3881  		rc =3D smb2_reconnect(S=
MB2_INTERNAL_CMD, tcon, server);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3882  		if (rc)
81b88cd97eb7df Shyam Prasad N   2021-10-30  3883  			resched =3D true;
81b88cd97eb7df Shyam Prasad N   2021-10-30  3884  		list_del_init(&ses->rli=
st);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3885  		cifs_put_smb_ses(ses);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3886  	}
81b88cd97eb7df Shyam Prasad N   2021-10-30  3887  	kfree(tcon);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3888  =

81b88cd97eb7df Shyam Prasad N   2021-10-30  3889  done:
81b88cd97eb7df Shyam Prasad N   2021-10-30  3890  	cifs_dbg(FYI, "Reconnect=
ing tcons and channels finished\n");
18ea43113f5b74 Germano Percossi 2017-04-07  3891  	if (resched)
18ea43113f5b74 Germano Percossi 2017-04-07  3892  		queue_delayed_work(cifs=
iod_wq, &server->reconnect, 2 * HZ);
81b88cd97eb7df Shyam Prasad N   2021-10-30  3893  	mutex_unlock(&pserver->r=
econnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3894  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3895  	/* now we can safely rel=
ease srv struct */
81b88cd97eb7df Shyam Prasad N   2021-10-30  3896  	if (tcon_exist || ses_ex=
ist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3897  		cifs_put_tcp_session(se=
rver, 1);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3898  }
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3899  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5676981002044081738==--


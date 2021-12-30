Content-Type: multipart/mixed; boundary="===============2795919819091318195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [smfrench-smb3:for-next 7/12] fs/cifs/smb1ops.c:229 cifs_get_next_mid() error: uninitialized symbol 'reconnect'.
Date: Fri, 31 Dec 2021 07:40:48 +0800
Message-ID: <202112310745.OYSjA6DO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2795919819091318195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Steve French <stfrench@microsoft.com>

tree:   git://github.com/smfrench/smb3-kernel.git for-next
head:   3fe0b5a99f6e0726eb88cee160ee96b002d2a60d
commit: 5ef98b085643f129a3e5a818b6b539f97e038946 [7/12] cifs: take cifs_tcp=
_ses_lock for status checks
:::::: branch date: 6 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m021-20211230 (https://download.01.org/0day-ci/arch=
ive/20211231/202112310745.OYSjA6DO-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb1ops.c:229 cifs_get_next_mid() error: uninitialized symbol 'reco=
nnect'.

vim +/reconnect +229 fs/cifs/smb1ops.c

a891f0f895f4a7 Pavel Shilovsky            2012-05-23  139  =

88257360605f93 Pavel Shilovsky            2012-05-23  140  /*
88257360605f93 Pavel Shilovsky            2012-05-23  141   * Find a free m=
ultiplex id (SMB mid). Otherwise there could be
88257360605f93 Pavel Shilovsky            2012-05-23  142   * mid collision=
s which might cause problems, demultiplexing the
88257360605f93 Pavel Shilovsky            2012-05-23  143   * wrong respons=
e to this request. Multiplex ids could collide if
88257360605f93 Pavel Shilovsky            2012-05-23  144   * one of a seri=
es requests takes much longer than the others, or
88257360605f93 Pavel Shilovsky            2012-05-23  145   * if a very lar=
ge number of long lived requests (byte range
88257360605f93 Pavel Shilovsky            2012-05-23  146   * locks or Find=
Notify requests) are pending. No more than
88257360605f93 Pavel Shilovsky            2012-05-23  147   * 64K-1 request=
s can be outstanding at one time. If no
88257360605f93 Pavel Shilovsky            2012-05-23  148   * mids are avai=
lable, return zero. A future optimization
88257360605f93 Pavel Shilovsky            2012-05-23  149   * could make th=
e combination of mids and uid the key we use
88257360605f93 Pavel Shilovsky            2012-05-23  150   * to demultiple=
x on (rather than mid alone).
88257360605f93 Pavel Shilovsky            2012-05-23  151   * In addition t=
o the above check, the cifs demultiplex
88257360605f93 Pavel Shilovsky            2012-05-23  152   * code already =
used the command code as a secondary
88257360605f93 Pavel Shilovsky            2012-05-23  153   * check of the =
frame and if signing is negotiated the
88257360605f93 Pavel Shilovsky            2012-05-23  154   * response woul=
d be discarded if the mid were the same
88257360605f93 Pavel Shilovsky            2012-05-23  155   * but the signa=
ture was wrong. Since the mid is not put in the
88257360605f93 Pavel Shilovsky            2012-05-23  156   * pending queue=
 until later (when it is about to be dispatched)
88257360605f93 Pavel Shilovsky            2012-05-23  157   * we do have to=
 limit the number of outstanding requests
88257360605f93 Pavel Shilovsky            2012-05-23  158   * to somewhat l=
ess than 64K-1 although it is hard to imagine
88257360605f93 Pavel Shilovsky            2012-05-23  159   * so many threa=
ds being in the vfs at one time.
88257360605f93 Pavel Shilovsky            2012-05-23  160   */
88257360605f93 Pavel Shilovsky            2012-05-23  161  static __u64
88257360605f93 Pavel Shilovsky            2012-05-23  162  cifs_get_next_mi=
d(struct TCP_Server_Info *server)
88257360605f93 Pavel Shilovsky            2012-05-23  163  {
88257360605f93 Pavel Shilovsky            2012-05-23  164  	__u64 mid =3D 0;
88257360605f93 Pavel Shilovsky            2012-05-23  165  	__u16 last_mid,=
 cur_mid;
5ef98b085643f1 Shyam Prasad N             2021-07-19  166  	bool collision,=
 reconnect;
88257360605f93 Pavel Shilovsky            2012-05-23  167  =

88257360605f93 Pavel Shilovsky            2012-05-23  168  	spin_lock(&Glob=
alMid_Lock);
88257360605f93 Pavel Shilovsky            2012-05-23  169  =

88257360605f93 Pavel Shilovsky            2012-05-23  170  	/* mid is 16 bi=
t only for CIFS/SMB */
88257360605f93 Pavel Shilovsky            2012-05-23  171  	cur_mid =3D (__=
u16)((server->CurrentMid) & 0xffff);
88257360605f93 Pavel Shilovsky            2012-05-23  172  	/* we do not wa=
nt to loop forever */
88257360605f93 Pavel Shilovsky            2012-05-23  173  	last_mid =3D cu=
r_mid;
88257360605f93 Pavel Shilovsky            2012-05-23  174  	cur_mid++;
03d9a9fe3f3aec Roberto Bergantinos Corpas 2019-10-14  175  	/* avoid 0xFFFF=
 MID */
03d9a9fe3f3aec Roberto Bergantinos Corpas 2019-10-14  176  	if (cur_mid =3D=
=3D 0xffff)
03d9a9fe3f3aec Roberto Bergantinos Corpas 2019-10-14  177  		cur_mid++;
88257360605f93 Pavel Shilovsky            2012-05-23  178  =

88257360605f93 Pavel Shilovsky            2012-05-23  179  	/*
88257360605f93 Pavel Shilovsky            2012-05-23  180  	 * This nested =
loop looks more expensive than it is.
88257360605f93 Pavel Shilovsky            2012-05-23  181  	 * In practice =
the list of pending requests is short,
88257360605f93 Pavel Shilovsky            2012-05-23  182  	 * fewer than 5=
0, and the mids are likely to be unique
88257360605f93 Pavel Shilovsky            2012-05-23  183  	 * on the first=
 pass through the loop unless some request
88257360605f93 Pavel Shilovsky            2012-05-23  184  	 * takes longer=
 than the 64 thousand requests before it
88257360605f93 Pavel Shilovsky            2012-05-23  185  	 * (and it woul=
d also have to have been a request that
88257360605f93 Pavel Shilovsky            2012-05-23  186  	 * did not time=
 out).
88257360605f93 Pavel Shilovsky            2012-05-23  187  	 */
88257360605f93 Pavel Shilovsky            2012-05-23  188  	while (cur_mid =
!=3D last_mid) {
88257360605f93 Pavel Shilovsky            2012-05-23  189  		struct mid_q_e=
ntry *mid_entry;
88257360605f93 Pavel Shilovsky            2012-05-23  190  		unsigned int n=
um_mids;
88257360605f93 Pavel Shilovsky            2012-05-23  191  =

88257360605f93 Pavel Shilovsky            2012-05-23  192  		collision =3D =
false;
88257360605f93 Pavel Shilovsky            2012-05-23  193  		if (cur_mid =
=3D=3D 0)
88257360605f93 Pavel Shilovsky            2012-05-23  194  			cur_mid++;
88257360605f93 Pavel Shilovsky            2012-05-23  195  =

88257360605f93 Pavel Shilovsky            2012-05-23  196  		num_mids =3D 0;
88257360605f93 Pavel Shilovsky            2012-05-23  197  		list_for_each_=
entry(mid_entry, &server->pending_mid_q, qhead) {
88257360605f93 Pavel Shilovsky            2012-05-23  198  			++num_mids;
88257360605f93 Pavel Shilovsky            2012-05-23  199  			if (mid_entry=
->mid =3D=3D cur_mid &&
88257360605f93 Pavel Shilovsky            2012-05-23  200  			    mid_entry=
->mid_state =3D=3D MID_REQUEST_SUBMITTED) {
88257360605f93 Pavel Shilovsky            2012-05-23  201  				/* This mid =
is in use, try a different one */
88257360605f93 Pavel Shilovsky            2012-05-23  202  				collision =
=3D true;
88257360605f93 Pavel Shilovsky            2012-05-23  203  				break;
88257360605f93 Pavel Shilovsky            2012-05-23  204  			}
88257360605f93 Pavel Shilovsky            2012-05-23  205  		}
88257360605f93 Pavel Shilovsky            2012-05-23  206  =

88257360605f93 Pavel Shilovsky            2012-05-23  207  		/*
88257360605f93 Pavel Shilovsky            2012-05-23  208  		 * if we have =
more than 32k mids in the list, then something
88257360605f93 Pavel Shilovsky            2012-05-23  209  		 * is very wro=
ng. Possibly a local user is trying to DoS the
88257360605f93 Pavel Shilovsky            2012-05-23  210  		 * box by issu=
ing long-running calls and SIGKILL'ing them. If
88257360605f93 Pavel Shilovsky            2012-05-23  211  		 * we get to 2=
^16 mids then we're in big trouble as this
88257360605f93 Pavel Shilovsky            2012-05-23  212  		 * function co=
uld loop forever.
88257360605f93 Pavel Shilovsky            2012-05-23  213  		 *
88257360605f93 Pavel Shilovsky            2012-05-23  214  		 * Go ahead an=
d assign out the mid in this situation, but force
88257360605f93 Pavel Shilovsky            2012-05-23  215  		 * an eventual=
 reconnect to clean out the pending_mid_q.
88257360605f93 Pavel Shilovsky            2012-05-23  216  		 */
88257360605f93 Pavel Shilovsky            2012-05-23  217  		if (num_mids >=
 32768)
5ef98b085643f1 Shyam Prasad N             2021-07-19  218  			reconnect =3D=
 true;
88257360605f93 Pavel Shilovsky            2012-05-23  219  =

88257360605f93 Pavel Shilovsky            2012-05-23  220  		if (!collision=
) {
88257360605f93 Pavel Shilovsky            2012-05-23  221  			mid =3D (__u6=
4)cur_mid;
88257360605f93 Pavel Shilovsky            2012-05-23  222  			server->Curre=
ntMid =3D mid;
88257360605f93 Pavel Shilovsky            2012-05-23  223  			break;
88257360605f93 Pavel Shilovsky            2012-05-23  224  		}
88257360605f93 Pavel Shilovsky            2012-05-23  225  		cur_mid++;
88257360605f93 Pavel Shilovsky            2012-05-23  226  	}
88257360605f93 Pavel Shilovsky            2012-05-23  227  	spin_unlock(&Gl=
obalMid_Lock);
5ef98b085643f1 Shyam Prasad N             2021-07-19  228  =

5ef98b085643f1 Shyam Prasad N             2021-07-19 @229  	if (reconnect) {
5ef98b085643f1 Shyam Prasad N             2021-07-19  230  		spin_lock(&cif=
s_tcp_ses_lock);
5ef98b085643f1 Shyam Prasad N             2021-07-19  231  		server->tcpSta=
tus =3D CifsNeedReconnect;
5ef98b085643f1 Shyam Prasad N             2021-07-19  232  		spin_unlock(&c=
ifs_tcp_ses_lock);
5ef98b085643f1 Shyam Prasad N             2021-07-19  233  	}
5ef98b085643f1 Shyam Prasad N             2021-07-19  234  =

88257360605f93 Pavel Shilovsky            2012-05-23  235  	return mid;
88257360605f93 Pavel Shilovsky            2012-05-23  236  }
88257360605f93 Pavel Shilovsky            2012-05-23  237  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2795919819091318195==--


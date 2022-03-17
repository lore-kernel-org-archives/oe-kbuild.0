Content-Type: multipart/mixed; boundary="===============1731866980628308377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10833/13392] fs/cifs/sess.c:195:42-47: ERROR: invalid reference to the index variable of the iterator on line 177
Date: Fri, 18 Mar 2022 07:22:08 +0800
Message-ID: <202203180730.nxPIKEDk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1731866980628308377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   97add482e9033a9386baa8824fbea34d0cbfe663
commit: 6a4006fdea4a1a1274d1faafef6e993987f982ca [10833/13392] cifs: change=
 iface_list from array to sorted linked list
:::::: branch date: 14 hours ago
:::::: commit date: 8 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220318/202203180730.nxPIKEDk-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/cifs/sess.c:195:42-47: ERROR: invalid reference to the index variable=
 of the iterator on line 177

vim +195 fs/cifs/sess.c

d1a931ce2e3b77 Shyam Prasad N  2021-07-19  118  =

d70e9fa5588476 Aurelien Aptel  2019-09-20  119  /* returns number of channe=
ls added */
387ec58f339b0c Ronnie Sahlberg 2020-12-14  120  int cifs_try_adding_channel=
s(struct cifs_sb_info *cifs_sb, struct cifs_ses *ses)
d70e9fa5588476 Aurelien Aptel  2019-09-20  121  {
724244cdb38285 Shyam Prasad N  2021-07-19  122  	int old_chan_count, new_ch=
an_count;
724244cdb38285 Shyam Prasad N  2021-07-19  123  	int left;
d70e9fa5588476 Aurelien Aptel  2019-09-20  124  	int rc =3D 0;
65a37a34145ca6 Aurelien Aptel  2019-11-20  125  	int tries =3D 0;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  126  	struct cifs_server_iface *=
iface =3D NULL, *niface =3D NULL;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  127  	bool iface_found =3D false;
d70e9fa5588476 Aurelien Aptel  2019-09-20  128  =

724244cdb38285 Shyam Prasad N  2021-07-19  129  	spin_lock(&ses->chan_lock);
724244cdb38285 Shyam Prasad N  2021-07-19  130  =

724244cdb38285 Shyam Prasad N  2021-07-19  131  	new_chan_count =3D old_cha=
n_count =3D ses->chan_count;
724244cdb38285 Shyam Prasad N  2021-07-19  132  	left =3D ses->chan_max - s=
es->chan_count;
724244cdb38285 Shyam Prasad N  2021-07-19  133  =

d70e9fa5588476 Aurelien Aptel  2019-09-20  134  	if (left <=3D 0) {
88b024f556fcd5 Shyam Prasad N  2021-11-19  135  		spin_unlock(&ses->chan_lo=
ck);
d70e9fa5588476 Aurelien Aptel  2019-09-20  136  		cifs_dbg(FYI,
d70e9fa5588476 Aurelien Aptel  2019-09-20  137  			 "ses already at max_cha=
nnels (%zu), nothing to open\n",
d70e9fa5588476 Aurelien Aptel  2019-09-20  138  			 ses->chan_max);
d70e9fa5588476 Aurelien Aptel  2019-09-20  139  		return 0;
d70e9fa5588476 Aurelien Aptel  2019-09-20  140  	}
d70e9fa5588476 Aurelien Aptel  2019-09-20  141  =

53923e0fe2098f Steve French    2022-02-16  142  	if (ses->server->dialect <=
 SMB30_PROT_ID) {
53923e0fe2098f Steve French    2022-02-16  143  		spin_unlock(&ses->chan_lo=
ck);
53923e0fe2098f Steve French    2022-02-16  144  		cifs_dbg(VFS, "multichann=
el is not supported on this protocol version, use 3.0 or above\n");
53923e0fe2098f Steve French    2022-02-16  145  		return 0;
53923e0fe2098f Steve French    2022-02-16  146  	}
53923e0fe2098f Steve French    2022-02-16  147  =

9c2dc11df50d1c Steve French    2021-05-07  148  	if (!(ses->server->capabil=
ities & SMB2_GLOBAL_CAP_MULTI_CHANNEL)) {
9c2dc11df50d1c Steve French    2021-05-07  149  		ses->chan_max =3D 1;
724244cdb38285 Shyam Prasad N  2021-07-19  150  		spin_unlock(&ses->chan_lo=
ck);
0226487ad81464 Steve French    2021-11-15  151  		cifs_dbg(VFS, "server %s =
does not support multichannel\n", ses->server->hostname);
9c2dc11df50d1c Steve French    2021-05-07  152  		return 0;
9c2dc11df50d1c Steve French    2021-05-07  153  	}
724244cdb38285 Shyam Prasad N  2021-07-19  154  	spin_unlock(&ses->chan_loc=
k);
9c2dc11df50d1c Steve French    2021-05-07  155  =

65a37a34145ca6 Aurelien Aptel  2019-11-20  156  	/*
65a37a34145ca6 Aurelien Aptel  2019-11-20  157  	 * Keep connecting to same=
, fastest, iface for all channels as
65a37a34145ca6 Aurelien Aptel  2019-11-20  158  	 * long as its RSS. Try ne=
xt fastest one if not RSS or channel
65a37a34145ca6 Aurelien Aptel  2019-11-20  159  	 * creation fails.
65a37a34145ca6 Aurelien Aptel  2019-11-20  160  	 */
65a37a34145ca6 Aurelien Aptel  2019-11-20  161  	while (left > 0) {
d70e9fa5588476 Aurelien Aptel  2019-09-20  162  =

65a37a34145ca6 Aurelien Aptel  2019-11-20  163  		tries++;
65a37a34145ca6 Aurelien Aptel  2019-11-20  164  		if (tries > 3*ses->chan_m=
ax) {
bbbf9eafbfdaa2 Steve French    2020-05-30  165  			cifs_dbg(FYI, "too many =
channel open attempts (%d channels left to open)\n",
65a37a34145ca6 Aurelien Aptel  2019-11-20  166  				 left);
65a37a34145ca6 Aurelien Aptel  2019-11-20  167  			break;
65a37a34145ca6 Aurelien Aptel  2019-11-20  168  		}
65a37a34145ca6 Aurelien Aptel  2019-11-20  169  =

6a4006fdea4a1a Shyam Prasad N  2022-01-01  170  		spin_lock(&ses->iface_loc=
k);
6a4006fdea4a1a Shyam Prasad N  2022-01-01  171  		if (!ses->iface_count) {
6a4006fdea4a1a Shyam Prasad N  2022-01-01  172  			spin_unlock(&ses->iface_=
lock);
6a4006fdea4a1a Shyam Prasad N  2022-01-01  173  			break;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  174  		}
6a4006fdea4a1a Shyam Prasad N  2022-01-01  175  =

6a4006fdea4a1a Shyam Prasad N  2022-01-01  176  		iface_found =3D false;
6a4006fdea4a1a Shyam Prasad N  2022-01-01 @177  		list_for_each_entry_safe(=
iface, niface, &ses->iface_list,
6a4006fdea4a1a Shyam Prasad N  2022-01-01  178  				    iface_head) {
6a4006fdea4a1a Shyam Prasad N  2022-01-01  179  			/* skip ifaces that are =
unusable */
6a4006fdea4a1a Shyam Prasad N  2022-01-01  180  			if (!iface->is_active ||
6a4006fdea4a1a Shyam Prasad N  2022-01-01  181  			    (is_ses_using_iface(=
ses, iface) &&
6a4006fdea4a1a Shyam Prasad N  2022-01-01  182  			     !iface->rss_capable=
)) {
d70e9fa5588476 Aurelien Aptel  2019-09-20  183  				continue;
65a37a34145ca6 Aurelien Aptel  2019-11-20  184  			}
d70e9fa5588476 Aurelien Aptel  2019-09-20  185  =

6a4006fdea4a1a Shyam Prasad N  2022-01-01  186  			iface_found =3D true;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  187  			kref_get(&iface->refcoun=
t);
6a4006fdea4a1a Shyam Prasad N  2022-01-01  188  			break;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  189  		}
6a4006fdea4a1a Shyam Prasad N  2022-01-01  190  		spin_unlock(&ses->iface_l=
ock);
6a4006fdea4a1a Shyam Prasad N  2022-01-01  191  =

6a4006fdea4a1a Shyam Prasad N  2022-01-01  192  		if (!iface_found)
6a4006fdea4a1a Shyam Prasad N  2022-01-01  193  			break;
6a4006fdea4a1a Shyam Prasad N  2022-01-01  194  =

387ec58f339b0c Ronnie Sahlberg 2020-12-14 @195  		rc =3D cifs_ses_add_chann=
el(cifs_sb, ses, iface);
d70e9fa5588476 Aurelien Aptel  2019-09-20  196  		if (rc) {
6a4006fdea4a1a Shyam Prasad N  2022-01-01  197  			cifs_dbg(FYI, "failed to=
 open extra channel on iface:%pIS rc=3D%d\n",
6a4006fdea4a1a Shyam Prasad N  2022-01-01  198  				 &iface->sockaddr,
6a4006fdea4a1a Shyam Prasad N  2022-01-01  199  				 rc);
6a4006fdea4a1a Shyam Prasad N  2022-01-01  200  			kref_put(&iface->refcoun=
t, release_iface);
d70e9fa5588476 Aurelien Aptel  2019-09-20  201  			continue;
d70e9fa5588476 Aurelien Aptel  2019-09-20  202  		}
d70e9fa5588476 Aurelien Aptel  2019-09-20  203  =

6a4006fdea4a1a Shyam Prasad N  2022-01-01  204  		cifs_dbg(FYI, "successful=
ly opened new channel on iface:%pIS\n",
6a4006fdea4a1a Shyam Prasad N  2022-01-01  205  			 &iface->sockaddr);
d70e9fa5588476 Aurelien Aptel  2019-09-20  206  		left--;
724244cdb38285 Shyam Prasad N  2021-07-19  207  		new_chan_count++;
d70e9fa5588476 Aurelien Aptel  2019-09-20  208  	}
d70e9fa5588476 Aurelien Aptel  2019-09-20  209  =

724244cdb38285 Shyam Prasad N  2021-07-19  210  	return new_chan_count - ol=
d_chan_count;
d70e9fa5588476 Aurelien Aptel  2019-09-20  211  }
d70e9fa5588476 Aurelien Aptel  2019-09-20  212  =


:::::: The code at line 195 was first introduced by commit
:::::: 387ec58f339b0c45e3767395f11fa8dd3772131e cifs: simplify handling of =
cifs_sb/ctx->local_nls

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1731866980628308377==--


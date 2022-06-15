Content-Type: multipart/mixed; boundary="===============5876894916525651690=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [samba-ksmbd:for-next 2/5] fs/cifs/smb2ops.c:571 parse_server_interfaces() warn: sleeping in atomic context
Date: Wed, 15 Jun 2022 17:31:05 +0800
Message-ID: <202206151736.Oy7RWMHu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5876894916525651690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shyam Prasad N <sprasad@microsoft.com>

tree:   git://git.samba.org/ksmbd.git for-next
head:   43c233283f928be86531f030c8a3faa497a30e15
commit: 29c5f6efd1d496330e43ed2779ed371663f446b5 [2/5] cifs: change iface_l=
ist from array to sorted linked list
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-m021-20220613 (https://download.01.org/0day-ci/arch=
ive/20220615/202206151736.Oy7RWMHu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb2ops.c:571 parse_server_interfaces() warn: sleeping in atomic co=
ntext

vim +571 fs/cifs/smb2ops.c

fe856be475f7cf Aurelien Aptel 2018-06-14  511  =

fe856be475f7cf Aurelien Aptel 2018-06-14  512  static int
fe856be475f7cf Aurelien Aptel 2018-06-14  513  parse_server_interfaces(stru=
ct network_interface_info_ioctl_rsp *buf,
fe856be475f7cf Aurelien Aptel 2018-06-14  514  			size_t buf_len,
29c5f6efd1d496 Shyam Prasad N 2022-01-01  515  			struct cifs_ses *ses)
fe856be475f7cf Aurelien Aptel 2018-06-14  516  {
fe856be475f7cf Aurelien Aptel 2018-06-14  517  	struct network_interface_in=
fo_ioctl_rsp *p;
fe856be475f7cf Aurelien Aptel 2018-06-14  518  	struct sockaddr_in *addr4;
fe856be475f7cf Aurelien Aptel 2018-06-14  519  	struct sockaddr_in6 *addr6;
fe856be475f7cf Aurelien Aptel 2018-06-14  520  	struct iface_info_ipv4 *p4;
fe856be475f7cf Aurelien Aptel 2018-06-14  521  	struct iface_info_ipv6 *p6;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  522  	struct cifs_server_iface *i=
nfo =3D NULL, *iface =3D NULL, *niface =3D NULL;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  523  	struct cifs_server_iface tm=
p_iface;
fe856be475f7cf Aurelien Aptel 2018-06-14  524  	ssize_t bytes_left;
fe856be475f7cf Aurelien Aptel 2018-06-14  525  	size_t next =3D 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  526  	int nb_iface =3D 0;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  527  	int rc =3D 0, ret =3D 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  528  =

fe856be475f7cf Aurelien Aptel 2018-06-14  529  	bytes_left =3D buf_len;
fe856be475f7cf Aurelien Aptel 2018-06-14  530  	p =3D buf;
fe856be475f7cf Aurelien Aptel 2018-06-14  531  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  532  	spin_lock(&ses->iface_lock);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  533  	/*
29c5f6efd1d496 Shyam Prasad N 2022-01-01  534  	 * Go through iface_list an=
d do kref_put to remove
29c5f6efd1d496 Shyam Prasad N 2022-01-01  535  	 * any unused ifaces. iface=
s in use will be removed
29c5f6efd1d496 Shyam Prasad N 2022-01-01  536  	 * when the last user calls=
 a kref_put on it
29c5f6efd1d496 Shyam Prasad N 2022-01-01  537  	 */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  538  	list_for_each_entry_safe(if=
ace, niface, &ses->iface_list,
29c5f6efd1d496 Shyam Prasad N 2022-01-01  539  				 iface_head) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  540  		iface->is_active =3D 0;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  541  		kref_put(&iface->refcount,=
 release_iface);
fe856be475f7cf Aurelien Aptel 2018-06-14  542  	}
fe856be475f7cf Aurelien Aptel 2018-06-14  543  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  544  	while (bytes_left >=3D size=
of(*p)) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  545  		memset(&tmp_iface, 0, size=
of(tmp_iface));
29c5f6efd1d496 Shyam Prasad N 2022-01-01  546  		tmp_iface.speed =3D le64_t=
o_cpu(p->LinkSpeed);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  547  		tmp_iface.rdma_capable =3D=
 le32_to_cpu(p->Capability & RDMA_CAPABLE) ? 1 : 0;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  548  		tmp_iface.rss_capable =3D =
le32_to_cpu(p->Capability & RSS_CAPABLE) ? 1 : 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  549  =

fe856be475f7cf Aurelien Aptel 2018-06-14  550  		/*
29c5f6efd1d496 Shyam Prasad N 2022-01-01  551  		 * The iface_list is assum=
ed to be sorted by speed.
29c5f6efd1d496 Shyam Prasad N 2022-01-01  552  		 * Check if the new interf=
ace exists in that list.
29c5f6efd1d496 Shyam Prasad N 2022-01-01  553  		 * NEVER change iface. it =
could be in use.
29c5f6efd1d496 Shyam Prasad N 2022-01-01  554  		 * Add a new one instead
fe856be475f7cf Aurelien Aptel 2018-06-14  555  		 */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  556  		list_for_each_entry_safe(i=
face, niface, &ses->iface_list,
29c5f6efd1d496 Shyam Prasad N 2022-01-01  557  					 iface_head) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  558  			ret =3D iface_cmp(iface, =
&tmp_iface);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  559  			if (!ret) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  560  				/* just get a ref so tha=
t it doesn't get picked/freed */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  561  				iface->is_active =3D 1;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  562  				kref_get(&iface->refcoun=
t);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  563  				goto next_iface;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  564  			} else if (ret > 0) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  565  				/* all remaining ifaces =
are slower */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  566  				break;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  567  			}
29c5f6efd1d496 Shyam Prasad N 2022-01-01  568  		}
fe856be475f7cf Aurelien Aptel 2018-06-14  569  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  570  		/* no match. insert the en=
try in the list */
29c5f6efd1d496 Shyam Prasad N 2022-01-01 @571  		info =3D kmalloc(sizeof(st=
ruct cifs_server_iface),
29c5f6efd1d496 Shyam Prasad N 2022-01-01  572  			       GFP_KERNEL);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  573  		if (!info) {
fe856be475f7cf Aurelien Aptel 2018-06-14  574  			rc =3D -ENOMEM;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  575  			spin_unlock(&ses->iface_l=
ock);
fe856be475f7cf Aurelien Aptel 2018-06-14  576  			goto out;
fe856be475f7cf Aurelien Aptel 2018-06-14  577  		}
29c5f6efd1d496 Shyam Prasad N 2022-01-01  578  		memcpy(info, &tmp_iface, s=
izeof(tmp_iface));
fe856be475f7cf Aurelien Aptel 2018-06-14  579  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  580  		/* add this new entry to t=
he list */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  581  		kref_init(&info->refcount);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  582  		info->is_active =3D 1;
fe856be475f7cf Aurelien Aptel 2018-06-14  583  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  584  		cifs_dbg(FYI, "%s: adding =
iface %zu\n", __func__, ses->iface_count);
fe856be475f7cf Aurelien Aptel 2018-06-14  585  		cifs_dbg(FYI, "%s: speed %=
zu bps\n", __func__, info->speed);
fe856be475f7cf Aurelien Aptel 2018-06-14  586  		cifs_dbg(FYI, "%s: capabil=
ities 0x%08x\n", __func__,
fe856be475f7cf Aurelien Aptel 2018-06-14  587  			 le32_to_cpu(p->Capabilit=
y));
fe856be475f7cf Aurelien Aptel 2018-06-14  588  =

fe856be475f7cf Aurelien Aptel 2018-06-14  589  		switch (p->Family) {
fe856be475f7cf Aurelien Aptel 2018-06-14  590  		/*
fe856be475f7cf Aurelien Aptel 2018-06-14  591  		 * The kernel and wire soc=
ket structures have the same
fe856be475f7cf Aurelien Aptel 2018-06-14  592  		 * layout and use network =
byte order but make the
fe856be475f7cf Aurelien Aptel 2018-06-14  593  		 * conversion explicit in =
case either one changes.
fe856be475f7cf Aurelien Aptel 2018-06-14  594  		 */
fe856be475f7cf Aurelien Aptel 2018-06-14  595  		case INTERNETWORK:
fe856be475f7cf Aurelien Aptel 2018-06-14  596  			addr4 =3D (struct sockadd=
r_in *)&info->sockaddr;
fe856be475f7cf Aurelien Aptel 2018-06-14  597  			p4 =3D (struct iface_info=
_ipv4 *)p->Buffer;
fe856be475f7cf Aurelien Aptel 2018-06-14  598  			addr4->sin_family =3D AF_=
INET;
fe856be475f7cf Aurelien Aptel 2018-06-14  599  			memcpy(&addr4->sin_addr, =
&p4->IPv4Address, 4);
fe856be475f7cf Aurelien Aptel 2018-06-14  600  =

fe856be475f7cf Aurelien Aptel 2018-06-14  601  			/* [MS-SMB2] 2.2.32.5.1.1=
 Clients MUST ignore these */
fe856be475f7cf Aurelien Aptel 2018-06-14  602  			addr4->sin_port =3D cpu_t=
o_be16(CIFS_PORT);
fe856be475f7cf Aurelien Aptel 2018-06-14  603  =

fe856be475f7cf Aurelien Aptel 2018-06-14  604  			cifs_dbg(FYI, "%s: ipv4 %=
pI4\n", __func__,
fe856be475f7cf Aurelien Aptel 2018-06-14  605  				 &addr4->sin_addr);
fe856be475f7cf Aurelien Aptel 2018-06-14  606  			break;
fe856be475f7cf Aurelien Aptel 2018-06-14  607  		case INTERNETWORKV6:
fe856be475f7cf Aurelien Aptel 2018-06-14  608  			addr6 =3D	(struct sockadd=
r_in6 *)&info->sockaddr;
fe856be475f7cf Aurelien Aptel 2018-06-14  609  			p6 =3D (struct iface_info=
_ipv6 *)p->Buffer;
fe856be475f7cf Aurelien Aptel 2018-06-14  610  			addr6->sin6_family =3D AF=
_INET6;
fe856be475f7cf Aurelien Aptel 2018-06-14  611  			memcpy(&addr6->sin6_addr,=
 &p6->IPv6Address, 16);
fe856be475f7cf Aurelien Aptel 2018-06-14  612  =

fe856be475f7cf Aurelien Aptel 2018-06-14  613  			/* [MS-SMB2] 2.2.32.5.1.2=
 Clients MUST ignore these */
fe856be475f7cf Aurelien Aptel 2018-06-14  614  			addr6->sin6_flowinfo =3D =
0;
fe856be475f7cf Aurelien Aptel 2018-06-14  615  			addr6->sin6_scope_id =3D =
0;
fe856be475f7cf Aurelien Aptel 2018-06-14  616  			addr6->sin6_port =3D cpu_=
to_be16(CIFS_PORT);
fe856be475f7cf Aurelien Aptel 2018-06-14  617  =

fe856be475f7cf Aurelien Aptel 2018-06-14  618  			cifs_dbg(FYI, "%s: ipv6 %=
pI6\n", __func__,
fe856be475f7cf Aurelien Aptel 2018-06-14  619  				 &addr6->sin6_addr);
fe856be475f7cf Aurelien Aptel 2018-06-14  620  			break;
fe856be475f7cf Aurelien Aptel 2018-06-14  621  		default:
fe856be475f7cf Aurelien Aptel 2018-06-14  622  			cifs_dbg(VFS,
fe856be475f7cf Aurelien Aptel 2018-06-14  623  				 "%s: skipping unsupport=
ed socket family\n",
fe856be475f7cf Aurelien Aptel 2018-06-14  624  				 __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  625  			goto next_iface;
fe856be475f7cf Aurelien Aptel 2018-06-14  626  		}
fe856be475f7cf Aurelien Aptel 2018-06-14  627  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  628  		if (!list_entry_is_head(if=
ace, &ses->iface_list, iface_head))
29c5f6efd1d496 Shyam Prasad N 2022-01-01  629  			list_add_tail(&info->ifac=
e_head, &iface->iface_head);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  630  		else
29c5f6efd1d496 Shyam Prasad N 2022-01-01  631  			list_add_tail(&info->ifac=
e_head, &ses->iface_list);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  632  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  633  		ses->iface_count++;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  634  		ses->iface_last_update =3D=
 jiffies;
fe856be475f7cf Aurelien Aptel 2018-06-14  635  next_iface:
29c5f6efd1d496 Shyam Prasad N 2022-01-01  636  		nb_iface++;
fe856be475f7cf Aurelien Aptel 2018-06-14  637  		next =3D le32_to_cpu(p->Ne=
xt);
29c5f6efd1d496 Shyam Prasad N 2022-01-01  638  		if (!next) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  639  			bytes_left -=3D sizeof(*p=
);
fe856be475f7cf Aurelien Aptel 2018-06-14  640  			break;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  641  		}
fe856be475f7cf Aurelien Aptel 2018-06-14  642  		p =3D (struct network_inte=
rface_info_ioctl_rsp *)((u8 *)p+next);
fe856be475f7cf Aurelien Aptel 2018-06-14  643  		bytes_left -=3D next;
fe856be475f7cf Aurelien Aptel 2018-06-14  644  	}
29c5f6efd1d496 Shyam Prasad N 2022-01-01  645  	spin_unlock(&ses->iface_loc=
k);
fe856be475f7cf Aurelien Aptel 2018-06-14  646  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  647  	if (!nb_iface) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  648  		cifs_dbg(VFS, "%s: malform=
ed interface info\n", __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  649  		rc =3D -EINVAL;
fe856be475f7cf Aurelien Aptel 2018-06-14  650  		goto out;
fe856be475f7cf Aurelien Aptel 2018-06-14  651  	}
fe856be475f7cf Aurelien Aptel 2018-06-14  652  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  653  	/* Azure rounds the buffer =
size up 8, to a 16 byte boundary */
29c5f6efd1d496 Shyam Prasad N 2022-01-01  654  	if ((bytes_left > 8) || p->=
Next)
29c5f6efd1d496 Shyam Prasad N 2022-01-01  655  		cifs_dbg(VFS, "%s: incompl=
ete interface info\n", __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  656  =

35adffed079fdc Aurelien Aptel 2019-09-20  657  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  658  	if (!ses->iface_count) {
29c5f6efd1d496 Shyam Prasad N 2022-01-01  659  		rc =3D -EINVAL;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  660  		goto out;
29c5f6efd1d496 Shyam Prasad N 2022-01-01  661  	}
29c5f6efd1d496 Shyam Prasad N 2022-01-01  662  =

29c5f6efd1d496 Shyam Prasad N 2022-01-01  663  out:
29c5f6efd1d496 Shyam Prasad N 2022-01-01  664  	return rc;
35adffed079fdc Aurelien Aptel 2019-09-20  665  }
fe856be475f7cf Aurelien Aptel 2018-06-14  666  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5876894916525651690==--


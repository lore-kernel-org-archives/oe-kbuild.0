Content-Type: multipart/mixed; boundary="===============8003496904386768885=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [samba-ksmbd:for-next 28/28] fs/cifs/smb2ops.c:574 parse_server_interfaces() warn: sleeping in atomic context
Date: Thu, 26 May 2022 07:34:18 +0800
Message-ID: <202205260707.SqIvcdsE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8003496904386768885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/ksmbd.git for-next
head:   57bf5227c68fc4b9f21eb6bf6ff7dd6e15568776
commit: 57bf5227c68fc4b9f21eb6bf6ff7dd6e15568776 [28/28] smb3: 2 multichann=
el patches
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
526/202205260707.SqIvcdsE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb2ops.c:574 parse_server_interfaces() warn: sleeping in atomic co=
ntext

vim +574 fs/cifs/smb2ops.c

fe856be475f7cf5 Aurelien Aptel 2018-06-14  511  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  512  static int
fe856be475f7cf5 Aurelien Aptel 2018-06-14  513  parse_server_interfaces(str=
uct network_interface_info_ioctl_rsp *buf,
fe856be475f7cf5 Aurelien Aptel 2018-06-14  514  			size_t buf_len,
57bf5227c68fc4b Steve French   2022-05-25  515  			struct cifs_ses *ses)
fe856be475f7cf5 Aurelien Aptel 2018-06-14  516  {
fe856be475f7cf5 Aurelien Aptel 2018-06-14  517  	struct network_interface_i=
nfo_ioctl_rsp *p;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  518  	struct sockaddr_in *addr4;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  519  	struct sockaddr_in6 *addr6;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  520  	struct iface_info_ipv4 *p4;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  521  	struct iface_info_ipv6 *p6;
57bf5227c68fc4b Steve French   2022-05-25  522  	struct cifs_server_iface *=
info =3D NULL, *iface =3D NULL, *niface =3D NULL;
57bf5227c68fc4b Steve French   2022-05-25  523  	struct cifs_server_iface t=
mp_iface;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  524  	ssize_t bytes_left;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  525  	size_t next =3D 0;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  526  	int nb_iface =3D 0;
57bf5227c68fc4b Steve French   2022-05-25  527  	int rc =3D 0, ret =3D 0;
57bf5227c68fc4b Steve French   2022-05-25  528  	bool iface_found =3D false;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  529  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  530  	bytes_left =3D buf_len;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  531  	p =3D buf;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  532  =

57bf5227c68fc4b Steve French   2022-05-25  533  	spin_lock(&ses->iface_lock=
);
57bf5227c68fc4b Steve French   2022-05-25  534  	/*
57bf5227c68fc4b Steve French   2022-05-25  535  	 * Go through iface_list a=
nd do kref_put to remove
57bf5227c68fc4b Steve French   2022-05-25  536  	 * any unused ifaces. ifac=
es in use will be removed
57bf5227c68fc4b Steve French   2022-05-25  537  	 * when the last user call=
s a kref_put on it
57bf5227c68fc4b Steve French   2022-05-25  538  	 */
57bf5227c68fc4b Steve French   2022-05-25  539  	list_for_each_entry_safe(i=
face, niface, &ses->iface_list,
57bf5227c68fc4b Steve French   2022-05-25  540  				 iface_head) {
57bf5227c68fc4b Steve French   2022-05-25  541  		iface->is_active =3D 0;
57bf5227c68fc4b Steve French   2022-05-25  542  		kref_put(&iface->refcount=
, release_iface);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  543  	}
fe856be475f7cf5 Aurelien Aptel 2018-06-14  544  =

57bf5227c68fc4b Steve French   2022-05-25  545  	while (bytes_left >=3D siz=
eof(*p)) {
57bf5227c68fc4b Steve French   2022-05-25  546  		memset(&tmp_iface, 0, siz=
eof(tmp_iface));
57bf5227c68fc4b Steve French   2022-05-25  547  		tmp_iface.speed =3D le64_=
to_cpu(p->LinkSpeed);
57bf5227c68fc4b Steve French   2022-05-25  548  		tmp_iface.rdma_capable =
=3D le32_to_cpu(p->Capability & RDMA_CAPABLE) ? 1 : 0;
57bf5227c68fc4b Steve French   2022-05-25  549  		tmp_iface.rss_capable =3D=
 le32_to_cpu(p->Capability & RSS_CAPABLE) ? 1 : 0;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  550  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  551  		/*
57bf5227c68fc4b Steve French   2022-05-25  552  		 * The iface_list is assu=
med to be sorted by speed.
57bf5227c68fc4b Steve French   2022-05-25  553  		 * Check if the new inter=
face exists in that list.
57bf5227c68fc4b Steve French   2022-05-25  554  		 * NEVER change iface. it=
 could be in use.
57bf5227c68fc4b Steve French   2022-05-25  555  		 * Add a new one instead
fe856be475f7cf5 Aurelien Aptel 2018-06-14  556  		 */
57bf5227c68fc4b Steve French   2022-05-25  557  		iface_found =3D false;
57bf5227c68fc4b Steve French   2022-05-25  558  		list_for_each_entry_safe(=
iface, niface, &ses->iface_list,
57bf5227c68fc4b Steve French   2022-05-25  559  					 iface_head) {
57bf5227c68fc4b Steve French   2022-05-25  560  			ret =3D iface_cmp(iface,=
 &tmp_iface);
57bf5227c68fc4b Steve French   2022-05-25  561  			if (!ret) {
57bf5227c68fc4b Steve French   2022-05-25  562  				/* just get a ref so th=
at it doesn't get picked/freed */
57bf5227c68fc4b Steve French   2022-05-25  563  				iface->is_active =3D 1;
57bf5227c68fc4b Steve French   2022-05-25  564  				kref_get(&iface->refcou=
nt);
57bf5227c68fc4b Steve French   2022-05-25  565  				goto next_iface;
57bf5227c68fc4b Steve French   2022-05-25  566  			} else if (ret > 0) {
57bf5227c68fc4b Steve French   2022-05-25  567  				/* all remaining ifaces=
 are slower */
57bf5227c68fc4b Steve French   2022-05-25  568  				iface_found =3D true;
57bf5227c68fc4b Steve French   2022-05-25  569  				break;
57bf5227c68fc4b Steve French   2022-05-25  570  			}
57bf5227c68fc4b Steve French   2022-05-25  571  		}
fe856be475f7cf5 Aurelien Aptel 2018-06-14  572  =

57bf5227c68fc4b Steve French   2022-05-25  573  		/* no match. insert the e=
ntry in the list */
57bf5227c68fc4b Steve French   2022-05-25 @574  		info =3D kmalloc(sizeof(s=
truct cifs_server_iface),
57bf5227c68fc4b Steve French   2022-05-25  575  			       GFP_KERNEL);
57bf5227c68fc4b Steve French   2022-05-25  576  		if (!info) {
fe856be475f7cf5 Aurelien Aptel 2018-06-14  577  			rc =3D -ENOMEM;
57bf5227c68fc4b Steve French   2022-05-25  578  			spin_unlock(&ses->iface_=
lock);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  579  			goto out;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  580  		}
57bf5227c68fc4b Steve French   2022-05-25  581  		memcpy(info, &tmp_iface, =
sizeof(tmp_iface));
fe856be475f7cf5 Aurelien Aptel 2018-06-14  582  =

57bf5227c68fc4b Steve French   2022-05-25  583  		/* add this new entry to =
the list */
57bf5227c68fc4b Steve French   2022-05-25  584  		kref_init(&info->refcount=
);
57bf5227c68fc4b Steve French   2022-05-25  585  		info->is_active =3D 1;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  586  =

57bf5227c68fc4b Steve French   2022-05-25  587  		cifs_dbg(FYI, "%s: adding=
 iface %zu\n", __func__, ses->iface_count);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  588  		cifs_dbg(FYI, "%s: speed =
%zu bps\n", __func__, info->speed);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  589  		cifs_dbg(FYI, "%s: capabi=
lities 0x%08x\n", __func__,
fe856be475f7cf5 Aurelien Aptel 2018-06-14  590  			 le32_to_cpu(p->Capabili=
ty));
fe856be475f7cf5 Aurelien Aptel 2018-06-14  591  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  592  		switch (p->Family) {
fe856be475f7cf5 Aurelien Aptel 2018-06-14  593  		/*
fe856be475f7cf5 Aurelien Aptel 2018-06-14  594  		 * The kernel and wire so=
cket structures have the same
fe856be475f7cf5 Aurelien Aptel 2018-06-14  595  		 * layout and use network=
 byte order but make the
fe856be475f7cf5 Aurelien Aptel 2018-06-14  596  		 * conversion explicit in=
 case either one changes.
fe856be475f7cf5 Aurelien Aptel 2018-06-14  597  		 */
fe856be475f7cf5 Aurelien Aptel 2018-06-14  598  		case INTERNETWORK:
fe856be475f7cf5 Aurelien Aptel 2018-06-14  599  			addr4 =3D (struct sockad=
dr_in *)&info->sockaddr;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  600  			p4 =3D (struct iface_inf=
o_ipv4 *)p->Buffer;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  601  			addr4->sin_family =3D AF=
_INET;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  602  			memcpy(&addr4->sin_addr,=
 &p4->IPv4Address, 4);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  603  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  604  			/* [MS-SMB2] 2.2.32.5.1.=
1 Clients MUST ignore these */
fe856be475f7cf5 Aurelien Aptel 2018-06-14  605  			addr4->sin_port =3D cpu_=
to_be16(CIFS_PORT);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  606  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  607  			cifs_dbg(FYI, "%s: ipv4 =
%pI4\n", __func__,
fe856be475f7cf5 Aurelien Aptel 2018-06-14  608  				 &addr4->sin_addr);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  609  			break;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  610  		case INTERNETWORKV6:
fe856be475f7cf5 Aurelien Aptel 2018-06-14  611  			addr6 =3D	(struct sockad=
dr_in6 *)&info->sockaddr;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  612  			p6 =3D (struct iface_inf=
o_ipv6 *)p->Buffer;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  613  			addr6->sin6_family =3D A=
F_INET6;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  614  			memcpy(&addr6->sin6_addr=
, &p6->IPv6Address, 16);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  615  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  616  			/* [MS-SMB2] 2.2.32.5.1.=
2 Clients MUST ignore these */
fe856be475f7cf5 Aurelien Aptel 2018-06-14  617  			addr6->sin6_flowinfo =3D=
 0;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  618  			addr6->sin6_scope_id =3D=
 0;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  619  			addr6->sin6_port =3D cpu=
_to_be16(CIFS_PORT);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  620  =

fe856be475f7cf5 Aurelien Aptel 2018-06-14  621  			cifs_dbg(FYI, "%s: ipv6 =
%pI6\n", __func__,
fe856be475f7cf5 Aurelien Aptel 2018-06-14  622  				 &addr6->sin6_addr);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  623  			break;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  624  		default:
fe856be475f7cf5 Aurelien Aptel 2018-06-14  625  			cifs_dbg(VFS,
fe856be475f7cf5 Aurelien Aptel 2018-06-14  626  				 "%s: skipping unsuppor=
ted socket family\n",
fe856be475f7cf5 Aurelien Aptel 2018-06-14  627  				 __func__);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  628  			goto next_iface;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  629  		}
fe856be475f7cf5 Aurelien Aptel 2018-06-14  630  =

57bf5227c68fc4b Steve French   2022-05-25  631  		if (iface_found)
57bf5227c68fc4b Steve French   2022-05-25  632  			list_add_tail(&info->ifa=
ce_head, &iface->iface_head);
57bf5227c68fc4b Steve French   2022-05-25  633  		else
57bf5227c68fc4b Steve French   2022-05-25  634  			list_add_tail(&info->ifa=
ce_head, &ses->iface_list);
57bf5227c68fc4b Steve French   2022-05-25  635  =

57bf5227c68fc4b Steve French   2022-05-25  636  		ses->iface_count++;
57bf5227c68fc4b Steve French   2022-05-25  637  		ses->iface_last_update =
=3D jiffies;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  638  next_iface:
57bf5227c68fc4b Steve French   2022-05-25  639  		nb_iface++;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  640  		next =3D le32_to_cpu(p->N=
ext);
57bf5227c68fc4b Steve French   2022-05-25  641  		if (!next) {
57bf5227c68fc4b Steve French   2022-05-25  642  			bytes_left -=3D sizeof(*=
p);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  643  			break;
57bf5227c68fc4b Steve French   2022-05-25  644  		}
fe856be475f7cf5 Aurelien Aptel 2018-06-14  645  		p =3D (struct network_int=
erface_info_ioctl_rsp *)((u8 *)p+next);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  646  		bytes_left -=3D next;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  647  	}
57bf5227c68fc4b Steve French   2022-05-25  648  	spin_unlock(&ses->iface_lo=
ck);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  649  =

57bf5227c68fc4b Steve French   2022-05-25  650  	if (!nb_iface) {
57bf5227c68fc4b Steve French   2022-05-25  651  		cifs_dbg(VFS, "%s: malfor=
med interface info\n", __func__);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  652  		rc =3D -EINVAL;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  653  		goto out;
fe856be475f7cf5 Aurelien Aptel 2018-06-14  654  	}
fe856be475f7cf5 Aurelien Aptel 2018-06-14  655  =

57bf5227c68fc4b Steve French   2022-05-25  656  	/* Azure rounds the buffer=
 size up 8, to a 16 byte boundary */
57bf5227c68fc4b Steve French   2022-05-25  657  	if ((bytes_left > 8) || p-=
>Next)
57bf5227c68fc4b Steve French   2022-05-25  658  		cifs_dbg(VFS, "%s: incomp=
lete interface info\n", __func__);
fe856be475f7cf5 Aurelien Aptel 2018-06-14  659  =

35adffed079fdcf Aurelien Aptel 2019-09-20  660  =

57bf5227c68fc4b Steve French   2022-05-25  661  	if (!ses->iface_count) {
57bf5227c68fc4b Steve French   2022-05-25  662  		rc =3D -EINVAL;
57bf5227c68fc4b Steve French   2022-05-25  663  		goto out;
57bf5227c68fc4b Steve French   2022-05-25  664  	}
57bf5227c68fc4b Steve French   2022-05-25  665  =

57bf5227c68fc4b Steve French   2022-05-25  666  out:
57bf5227c68fc4b Steve French   2022-05-25  667  	return rc;
35adffed079fdcf Aurelien Aptel 2019-09-20  668  }
fe856be475f7cf5 Aurelien Aptel 2018-06-14  669  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8003496904386768885==--


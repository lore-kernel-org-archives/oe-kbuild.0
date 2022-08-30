Content-Type: multipart/mixed; boundary="===============2862971367582139004=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2 1/3] cifs: introduce AES-GMAC signing support for SMB 3.1.1
Date: Wed, 31 Aug 2022 05:27:54 +0800
Message-ID: <202208310526.DwSOBsS4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2862971367582139004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220829213354.2714-2-ematsumiya@suse.de>
References: <20220829213354.2714-2-ematsumiya@suse.de>
TO: Enzo Matsumiya <ematsumiya@suse.de>

Hi Enzo,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.0-rc3 next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/cifs-=
introduce-support-for-AES-GMAC-signing/20220830-053851
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20831/202208310526.DwSOBsS4-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb2transport.c:666 smb2_verify_signature() warn: impossible condit=
ion '(shdr->Command =3D=3D 18446744073709551615) =3D> (0-u16max =3D=3D u64m=
ax)'

vim +666 fs/cifs/smb2transport.c

3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  654  =

3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  655  int
0b688cfc8b3472 Jeff Layton     2012-09-18  656  smb2_verify_signature(struc=
t smb_rqst *rqst, struct TCP_Server_Info *server)
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  657  {
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  658  	unsigned int rc;
edad734c74a4ab Steve French    2020-03-27  659  	char server_response_sig[S=
MB2_SIGNATURE_SIZE];
0d35e382e4e96a Ronnie Sahlberg 2021-11-05  660  	struct smb2_hdr *shdr =3D
0d35e382e4e96a Ronnie Sahlberg 2021-11-05  661  			(struct smb2_hdr *)rqst-=
>rq_iov[0].iov_base;
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  662  =

31473fc4f9653b Pavel Shilovsky 2016-10-24  663  	if ((shdr->Command =3D=3D =
SMB2_NEGOTIATE) ||
31473fc4f9653b Pavel Shilovsky 2016-10-24  664  	    (shdr->Command =3D=3D =
SMB2_SESSION_SETUP) ||
31473fc4f9653b Pavel Shilovsky 2016-10-24  665  	    (shdr->Command =3D=3D =
SMB2_OPLOCK_BREAK) ||
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29 @666  	    (shdr->Command =3D=3D =
0xFFFFFFFFFFFFFFFF) || /* MS-SMB2 3.2.5.1.3 */
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  667  	    (shdr->Status =3D=3D S=
TATUS_PENDING) || /* MS-SMB2 3.2.5.1.3 */
4f5c10f1ad45ae Steve French    2019-09-03  668  	    server->ignore_signatu=
re ||
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  669  	    (!server->session_esta=
b))
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  670  		return 0;
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  671  =

3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  672  	/*
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  673  	 * BB what if signatures a=
re supposed to be on for session but
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  674  	 * server does not send on=
e? BB
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  675  	 */
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  676  =

3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  677  	/*
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  678  	 * Save off the origiginal=
 signature so we can modify the smb and check
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  679  	 * our calculated signatur=
e against what the server sent.
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  680  	 */
31473fc4f9653b Pavel Shilovsky 2016-10-24  681  	memcpy(server_response_sig=
, shdr->Signature, SMB2_SIGNATURE_SIZE);
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  682  =

df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  683  	/*
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  684  	 * all implementations of =
->calc_signature() will zero shdr->Signature
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  685  	 * before computing it
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  686  	 */
eda1c54f148a86 Long Li         2020-03-31  687  	rc =3D server->ops->calc_s=
ignature(rqst, server, true);
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  688  	if (rc)
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  689  		return rc;
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  690  =

f460c502747305 Steve French    2020-03-29  691  	if (memcmp(server_response=
_sig, shdr->Signature, SMB2_SIGNATURE_SIZE)) {
9692ea9d3288a2 Steve French    2020-04-15  692  		cifs_dbg(VFS, "sign fail =
cmd 0x%x message id 0x%llx\n",
9692ea9d3288a2 Steve French    2020-04-15  693  			shdr->Command, shdr->Mes=
sageId);
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  694  		return -EACCES;
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  695  	}
df3d3cd4e3d4e8 Enzo Matsumiya  2022-08-29  696  =

3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  697  	return 0;
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  698  }
3c1bf7e48e9e46 Pavel Shilovsky 2012-09-18  699  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2862971367582139004==--


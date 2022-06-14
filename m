Content-Type: multipart/mixed; boundary="===============9048865868900169094=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/cifssmb.c:1386:17: warning: dereference of NULL 'tcon' [CWE-476]
Date: Tue, 14 Jun 2022 18:04:51 +0800
Message-ID: <202206141711.csuZqKbT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9048865868900169094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/cifs/cifssmb.c:1386:17: warning: dereference of NULL 'tcon' [CWE-476] [=
-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tanner Love <tannerlove@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: a358f40600b3b39ae3906b6118625b99c0aa7a34 once: implement DO_ONCE_LI=
TE for non-fast-path "do once" functionality
date:   12 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141711.csuZqKbT-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da358f40600b3b39ae3906b6118625b99c0aa7a34
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a358f40600b3b39ae3906b6118625b99c0aa7a34
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   fs/cifs/cifssmb.c: In function 'CIFS_open':
>> fs/cifs/cifssmb.c:1386:17: warning: dereference of NULL 'tcon' [CWE-476]=
 [-Wanalyzer-null-dereference]
    1386 |         if (tcon->ses->capabilities & CAP_UNIX)
         |             ~~~~^~~~~
     'CIFSSMBSetPathInfo': events 1-2
       |
       | 5838 | CIFSSMBSetPathInfo(const unsigned int xid, struct cifs_tcon=
 *tcon,
       |      | ^~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'CIFSSMBSetPathInfo'
       |......
       | 5855 |         rc =3D smb_init(SMB_COM_TRANSACTION2, 15, tcon, (vo=
id **) &pSMB,
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
       |      |              |
       |      |              (2) calling 'smb_init' from 'CIFSSMBSetPathInf=
o'
       | 5856 |                       (void **) &pSMBr);
       |      |                       ~~~~~~~~~~~~~~~~~
       |
       +--> 'smb_init': events 3-6
              |
              |  353 | smb_init(int smb_command, int wct, struct cifs_tcon =
*tcon,
              |      | ^~~~~~~~
              |      | |
              |      | (3) entry to 'smb_init'
              |......
              |  359 |         if (rc)
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch (when 'rc =
=3D=3D 0')...
              |......
              |  362 |         return __smb_init(smb_command, wct, tcon, re=
quest_buf, response_buf);
              |      |         ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |      |
              |      |         |      (6) calling '__smb_init' from 'smb_in=
it'
              |      |         (5) ...to here
              |
              +--> '__smb_init': events 7-12
                     |
                     |  327 | __smb_init(int smb_command, int wct, struct c=
ifs_tcon *tcon,
                     |      | ^~~~~~~~~~
                     |      | |
                     |      | (7) entry to '__smb_init'
                     |......
                     |  331 |         if (*request_buf =3D=3D NULL) {
                     |      |            ~
                     |      |            |
                     |      |            (8) following 'false' branch...
                     |......
                     |  339 |         if (response_buf)
                     |      |         ~~ ~
                     |      |         |  |
                     |      |         |  (10) following 'true' branch (when=
 'response_buf' is non-NULL)...
                     |      |         (9) ...to here
                     |  340 |                 *response_buf =3D *request_bu=
f;
                     |      |                 ~
                     |      |                 |
                     |      |                 (11) ...to here
                     |......
                     |  345 |         if (tcon !=3D NULL)
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'false' branch (whe=
n 'tcon' is NULL)...
                     |
                   '__smb_init': event 13
                     |
                     |cc1:
                     | (13): ...to here
                     |
              <------+
              |
            'smb_init': event 14
              |
              |  362 |         return __smb_init(smb_command, wct, tcon, re=
quest_buf, response_buf);
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (14) returning to 'smb_init' from '__=
smb_init'
              |
       <------+
       |
     'CIFSSMBSetPathInfo': events 15-17
       |
       | 5855 |         rc =3D smb_init(SMB_COM_TRANSACTION2, 15, tcon, (vo=
id **) &pSMB,
       |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
       |      |              |
       |      |              (15) returning to 'CIFSSMBSetPathInfo' from 's=
mb_init'
       | 5856 |                       (void **) &pSMBr);
       |      |                       ~~~~~~~~~~~~~~~~~
       | 5857 |         if (rc)
       |      |            ~  =

       |      |            |
       |      |            (16) following 'false' branch (when 'rc =3D=3D 0=
')...
       |......
       | 5860 |         if (pSMB->hdr.Flags2 & SMBFLG2_UNICODE) {
       |      |         ~~    =

       |      |         |
       |      |         (17) ...to here
       |
     'CIFSSMBSetPathInfo': events 18-19
       |
       |include/linux/fortify-string.h:189:12:
       |  189 |         if (p_size < size || q_size < size)
       |      |            ^

vim +/tcon +1386 fs/cifs/cifssmb.c

a9d02ad49013c8 Steve French    2005-08-24  1319  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1320  int
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1321  CIFS_open(const unsigned i=
nt xid, struct cifs_open_parms *oparms, int *oplock,
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1322  	  FILE_ALL_INFO *buf)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1323  {
1afdea4f19a97e Colin Ian King  2019-07-23  1324  	int rc;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1325  	OPEN_REQ *req =3D NULL;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1326  	OPEN_RSP *rsp =3D NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1327  	int bytes_returned;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1328  	int name_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1329  	__u16 count;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1330  	struct cifs_sb_info *cifs=
_sb =3D oparms->cifs_sb;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1331  	struct cifs_tcon *tcon =
=3D oparms->tcon;
2baa2682531ff0 Steve French    2014-09-27  1332  	int remap =3D cifs_remap(=
cifs_sb);
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1333  	const struct nls_table *n=
ls =3D cifs_sb->local_nls;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1334  	int create_options =3D op=
arms->create_options;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1335  	int desired_access =3D op=
arms->desired_access;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1336  	int disposition =3D oparm=
s->disposition;
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1337  	const char *path =3D opar=
ms->path;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1338  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1339  openRetry:
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1340  	rc =3D smb_init(SMB_COM_N=
T_CREATE_ANDX, 24, tcon, (void **)&req,
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1341  		      (void **)&rsp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1342  	if (rc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1343  		return rc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1344  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1345  	/* no commands go after t=
his */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1346  	req->AndXCommand =3D 0xFF;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1347  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1348  	if (req->hdr.Flags2 & SMB=
FLG2_UNICODE) {
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1349  		/* account for one byte =
pad to word boundary */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1350  		count =3D 1;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1351  		name_len =3D cifsConvert=
ToUTF16((__le16 *)(req->fileName + 1),
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1352  					      path, PATH_MAX,=
 nls, remap);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1353  		/* trailing null */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1354  		name_len++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1355  		name_len *=3D 2;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1356  		req->NameLength =3D cpu_=
to_le16(name_len);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1357  	} else {
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1358  		/* BB improve check for =
buffer overruns BB */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1359  		/* no pad */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1360  		count =3D 0;
340625e618e1b3 Ronnie Sahlberg 2019-08-27  1361  		name_len =3D copy_path_n=
ame(req->fileName, path);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1362  		req->NameLength =3D cpu_=
to_le16(name_len);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1363  	}
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1364  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1365  	if (*oplock & REQ_OPLOCK)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1366  		req->OpenFlags =3D cpu_t=
o_le32(REQ_OPLOCK);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1367  	else if (*oplock & REQ_BA=
TCHOPLOCK)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1368  		req->OpenFlags =3D cpu_t=
o_le32(REQ_BATCHOPLOCK);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1369  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1370  	req->DesiredAccess =3D cp=
u_to_le32(desired_access);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1371  	req->AllocationSize =3D 0;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1372  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1373  	/*
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1374  	 * Set file as system fil=
e if special file such as fifo and server
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1375  	 * expecting SFU style an=
d no Unix extensions.
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1376  	 */
eda3c029899cbf Steve French    2005-07-21  1377  	if (create_options & CREA=
TE_OPTION_SPECIAL)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1378  		req->FileAttributes =3D =
cpu_to_le32(ATTR_SYSTEM);
eda3c029899cbf Steve French    2005-07-21  1379  	else
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1380  		req->FileAttributes =3D =
cpu_to_le32(ATTR_NORMAL);
67750fb9e07940 Jeff Layton     2008-05-09  1381  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1382  	/*
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1383  	 * XP does not handle ATT=
R_POSIX_SEMANTICS but it helps speed up case
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1384  	 * sensitive checks for o=
ther servers such as Samba.
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1385  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1386  	if (tcon->ses->capabiliti=
es & CAP_UNIX)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1387  		req->FileAttributes |=3D=
 cpu_to_le32(ATTR_POSIX_SEMANTICS);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1388  =

67750fb9e07940 Jeff Layton     2008-05-09  1389  	if (create_options & CREA=
TE_OPTION_READONLY)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1390  		req->FileAttributes |=3D=
 cpu_to_le32(ATTR_READONLY);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1391  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1392  	req->ShareAccess =3D cpu_=
to_le32(FILE_SHARE_ALL);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1393  	req->CreateDisposition =
=3D cpu_to_le32(disposition);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1394  	req->CreateOptions =3D cp=
u_to_le32(create_options & CREATE_OPTIONS_MASK);
67750fb9e07940 Jeff Layton     2008-05-09  1395  =

09d1db5c613123 Steve French    2005-04-28  1396  	/* BB Expirement with var=
ious impersonation levels and verify */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1397  	req->ImpersonationLevel =
=3D cpu_to_le32(SECURITY_IMPERSONATION);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1398  	req->SecurityFlags =3D SE=
CURITY_CONTEXT_TRACKING|SECURITY_EFFECTIVE_ONLY;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1399  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1400  	count +=3D name_len;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1401  	inc_rfc1001_len(req, coun=
t);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1402  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1403  	req->ByteCount =3D cpu_to=
_le16(count);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1404  	rc =3D SendReceive(xid, t=
con->ses, (struct smb_hdr *)req,
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1405  			 (struct smb_hdr *)rsp,=
 &bytes_returned, 0);
44c581866e2ae4 Pavel Shilovsky 2012-05-28  1406  	cifs_stats_inc(&tcon->sta=
ts.cifs_stats.num_opens);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1407  	if (rc) {
f96637be081141 Joe Perches     2013-05-04  1408  		cifs_dbg(FYI, "Error in =
Open =3D %d\n", rc);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1409  		cifs_buf_release(req);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1410  		if (rc =3D=3D -EAGAIN)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1411  			goto openRetry;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1412  		return rc;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1413  	}
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1414  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1415  	/* 1 byte no need to le_t=
o_cpu */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1416  	*oplock =3D rsp->OplockLe=
vel;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1417  	/* cifs fid stays in le */
d81b8a40e2ece0 Pavel Shilovsky 2014-01-16  1418  	oparms->fid->netfid =3D r=
sp->Fid;
86f740f2aed5ea Aurelien Aptel  2020-02-21  1419  	oparms->fid->access =3D d=
esired_access;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1420  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1421  	/* Let caller know file w=
as created so we can set the mode. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1422  	/* Do we care about the C=
reateAction in any other cases? */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1423  	if (cpu_to_le32(FILE_CREA=
TE) =3D=3D rsp->CreateAction)
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1424  		*oplock |=3D CIFS_CREATE=
_ACTION;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1425  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1426  	if (buf) {
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1427  		/* copy from CreationTim=
e to Attributes */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1428  		memcpy((char *)buf, (cha=
r *)&rsp->CreationTime, 36);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1429  		/* the file_info buf is =
endian converted by caller */
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1430  		buf->AllocationSize =3D =
rsp->AllocationSize;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1431  		buf->EndOfFile =3D rsp->=
EndOfFile;
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1432  		buf->NumberOfLinks =3D c=
pu_to_le32(1);
9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1433  		buf->DeletePending =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1434  	}
a5a2b489bae8f6 Steve French    2005-08-20  1435  =

9bf4fa01f9aaf2 Pavel Shilovsky 2014-01-16  1436  	cifs_buf_release(req);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1437  	return rc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1438  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1439  =


:::::: The code at line 1386 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9048865868900169094==--


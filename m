Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00941FB4
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687419996; x=1718955996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NBM48iIFWiwhUVcz7YJFCFjgr3Zm+wdiuuez5bBKeM4=;
  b=NNuNNphWu1k8zUg318T2lu9njdH+PPHCh62s9+TpAz4QKcQIY4rBsuw0
   31CHA3CyvduIO4qcLdlrEd+iJJ5BQTGcjPTIWESCC73T9AP2DwlIDffFH
   mNfjsUhDlMW959XCmr9js+O9qqC6F2yVnzkXmpNXZphVwh/99aN/SvBzu
   vK4V/CIJb4WA50JKECZXrlQGx5EP1AxfGOvKzq4ld8wciRdczNAd4NbPp
   nQXFZcC7151Lb1yi+twiX8QB6KwA8m6vCtJ+wJ+n610xpL3qHe0N2XsnU
   BvJltVXFbULMeJfmRRnrP1kQjFAYlRMiAC9DJILRX6W1EiGyR8ad953Ea
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357908526"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357908526"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 00:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="827786861"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="827786861"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2023 00:46:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCF1U-0007QA-26;
	Thu, 22 Jun 2023 07:46:32 +0000
Date: Thu, 22 Jun 2023 15:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/smb2ops.c:2029 smb3_enum_snapshots() warn: variable
 dereferenced before check 'ioc_buf' (see line 2003)
Message-ID: <202306221539.2zBvWDuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: m68k-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230622/202306221539.2zBvWDuV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221539.2zBvWDuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306221539.2zBvWDuV-lkp@intel.com/

smatch warnings:
fs/smb/client/smb2ops.c:2029 smb3_enum_snapshots() warn: variable dereferenced before check 'ioc_buf' (see line 2003)
fs/smb/client/dfs_cache.c:403 copy_ref_data() warn: passing a valid pointer to 'PTR_ERR'

vim +/ioc_buf +2029 fs/smb/client/smb2ops.c

153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  1980  
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  1981  /*
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  1982   * Input buffer contains (empty) struct smb_snapshot array with size filled in
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  1983   * For output see struct SRV_SNAPSHOT_ARRAY in MS-SMB2 section 2.2.32.2
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  1984   */
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1985  static int
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1986  smb3_enum_snapshots(const unsigned int xid, struct cifs_tcon *tcon,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1987  		   struct cifsFileInfo *cfile, void __user *ioc_buf)
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1988  {
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1989  	char *retbuf = NULL;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1990  	unsigned int ret_data_len = 0;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1991  	int rc;
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  1992  	u32 max_response_size;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1993  	struct smb_snapshot_array snapshot_in;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  1994  
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  1995  	/*
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  1996  	 * On the first query to enumerate the list of snapshots available
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  1997  	 * for this volume the buffer begins with 0 (number of snapshots
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  1998  	 * which can be returned is zero since at that point we do not know
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  1999  	 * how big the buffer needs to be). On the second query,
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  2000  	 * it (ret_data_len) is set to number of snapshots so we can
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  2001  	 * know to set the maximum response size larger (see below).
973189aba69e59 fs/cifs/smb2ops.c Steve French 2019-04-04  2002  	 */
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28 @2003  	if (get_user(ret_data_len, (unsigned int __user *)ioc_buf))
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2004  		return -EFAULT;
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2005  
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2006  	/*
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2007  	 * Note that for snapshot queries that servers like Azure expect that
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2008  	 * the first query be minimal size (and just used to get the number/size
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2009  	 * of previous versions) so response size must be specified as EXACTLY
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2010  	 * sizeof(struct snapshot_array) which is 16 when rounded up to multiple
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2011  	 * of eight bytes.
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2012  	 */
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2013  	if (ret_data_len == 0)
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2014  		max_response_size = MIN_SNAPSHOT_ARRAY_SIZE;
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2015  	else
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2016  		max_response_size = CIFSMaxBufSize;
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2017  
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2018  	rc = SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2019  			cfile->fid.volatile_fid,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2020  			FSCTL_SRV_ENUMERATE_SNAPSHOTS,
153322f7536a18 fs/cifs/smb2ops.c Steve French 2019-03-28  2021  			NULL, 0 /* no input data */, max_response_size,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2022  			(char **)&retbuf,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2023  			&ret_data_len);
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2024  	cifs_dbg(FYI, "enum snaphots ioctl returned %d and ret buflen is %d\n",
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2025  			rc, ret_data_len);
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2026  	if (rc)
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2027  		return rc;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2028  
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30 @2029  	if (ret_data_len && (ioc_buf != NULL) && (retbuf != NULL)) {
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2030  		/* Fixup buffer */
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2031  		if (copy_from_user(&snapshot_in, ioc_buf,
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2032  		    sizeof(struct smb_snapshot_array))) {
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2033  			rc = -EFAULT;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2034  			kfree(retbuf);
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2035  			return rc;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2036  		}
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2037  
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2038  		/*
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2039  		 * Check for min size, ie not large enough to fit even one GMT
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2040  		 * token (snapshot).  On the first ioctl some users may pass in
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2041  		 * smaller size (or zero) to simply get the size of the array
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2042  		 * so the user space caller can allocate sufficient memory
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2043  		 * and retry the ioctl again with larger array size sufficient
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2044  		 * to hold all of the snapshot GMT tokens on the second try.
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2045  		 */
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2046  		if (snapshot_in.snapshot_array_size < GMT_TOKEN_SIZE)
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2047  			ret_data_len = sizeof(struct smb_snapshot_array);
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2048  
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2049  		/*
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2050  		 * We return struct SRV_SNAPSHOT_ARRAY, followed by
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2051  		 * the snapshot array (of 50 byte GMT tokens) each
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2052  		 * representing an available previous version of the data
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2053  		 */
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2054  		if (ret_data_len > (snapshot_in.snapshot_array_size +
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2055  					sizeof(struct smb_snapshot_array)))
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2056  			ret_data_len = snapshot_in.snapshot_array_size +
e02789a53d7133 fs/cifs/smb2ops.c Steve French 2018-08-09  2057  					sizeof(struct smb_snapshot_array);
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2058  
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2059  		if (copy_to_user(ioc_buf, retbuf, ret_data_len))
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2060  			rc = -EFAULT;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2061  	}
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2062  
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2063  	kfree(retbuf);
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2064  	return rc;
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2065  }
834170c85978b0 fs/cifs/smb2ops.c Steve French 2016-09-30  2066  

:::::: The code at line 2029 was first introduced by commit
:::::: 834170c85978b0e85805364f623393968f7a9b5e Enable previous version support

:::::: TO: Steve French <smfrench@gmail.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

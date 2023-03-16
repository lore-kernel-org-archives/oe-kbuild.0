Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C6F37C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 01:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678930997; x=1710466997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymZBTKmooRc2qc3nzDSWJAIfHPaU87NMcc7ygehEvC0=;
  b=DPX+t4Oo28+SxQ2YNyqqEHW9i6QIXwdLaOe2QlIwTqs+6dgsyul+XEdT
   /xiuQR48aQzmPlAlpuJFz71gq5FdbwR/vxMSKUmyBqflJb06sYiduCGam
   uJNo3ItmQMKjrPqkQxQks2gUpO783jHRCSK1c9J+3otw0HsFlZwp+vzpy
   OwGCBPEtGe10q3nL+ekalWcSrVRjrrnfICxrzKPsFr+OkjMvzFqzK2Nbj
   9HYAaRB03c5pEP92VZbVq0dchpvmw2xzO8cf+yJK7XHR7CwO3uftcPPeS
   n4nlSJBMaLffLGBPXy/iP+55hfY3rM3aT1SsYgQZAWhC+2WtCXTYhakRh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424135796"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="424135796"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 18:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790071296"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="790071296"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 18:43:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcceB-0008D1-1H;
	Thu, 16 Mar 2023 01:43:15 +0000
Date: Thu, 16 Mar 2023 09:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 02/10] cifs: Make "resp_buf_type" initialization
 consistent
Message-ID: <202303160920.kX2EmZmU-lkp@intel.com>
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
In-Reply-To: <715459412f19853c56156b8c0ce39fe74f148860.1678885349.git.vl@samba.org>
References: <715459412f19853c56156b8c0ce39fe74f148860.1678885349.git.vl@samba.org>
TO: Volker Lendecke <vl@samba.org>
TO: linux-cifs@vger.kernel.org
CC: Volker Lendecke <vl@samba.org>

Hi Volker,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Volker-Lendecke/cifs-Simplify-some-callers-of-compound_send_recv/20230315-212751
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/715459412f19853c56156b8c0ce39fe74f148860.1678885349.git.vl%40samba.org
patch subject: [PATCH 02/10] cifs: Make "resp_buf_type" initialization consistent
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230316/202303160920.kX2EmZmU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160920.kX2EmZmU-lkp@intel.com/

New smatch warnings:
fs/cifs/smb2pdu.c:3031 SMB2_open() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:3258 SMB2_ioctl() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:3385 __SMB2_close() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:3590 query_info() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:3756 SMB2_change_notify() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:4021 SMB2_flush() error: uninitialized symbol 'resp_buftype'.
fs/cifs/smb2pdu.c:5077 SMB2_query_directory() error: uninitialized symbol 'resp_buftype'.
fs/cifs/cifssmb.c:2079 CIFSSMBPosixLock() error: uninitialized symbol 'resp_buf_type'.

Old smatch warnings:
fs/cifs/smb2pdu.c:3750 SMB2_change_notify() error: we previously assumed 'plen' could be null (see line 3709)
fs/cifs/cifssmb.c:4082 CIFSFindFirst() warn: missing error code? 'rc'
fs/cifs/cifssmb.c:4209 CIFSFindNext() warn: missing error code? 'rc'

vim +/resp_buftype +3031 fs/cifs/smb2pdu.c

f0df737ee820ec Pavel Shilovsky 2012-09-18  3013  
f0df737ee820ec Pavel Shilovsky 2012-09-18  3014  	if (buf) {
fbcff33d4204cb Kees Cook       2021-06-21  3015  		buf->CreationTime = rsp->CreationTime;
fbcff33d4204cb Kees Cook       2021-06-21  3016  		buf->LastAccessTime = rsp->LastAccessTime;
fbcff33d4204cb Kees Cook       2021-06-21  3017  		buf->LastWriteTime = rsp->LastWriteTime;
fbcff33d4204cb Kees Cook       2021-06-21  3018  		buf->ChangeTime = rsp->ChangeTime;
f0df737ee820ec Pavel Shilovsky 2012-09-18  3019  		buf->AllocationSize = rsp->AllocationSize;
f0df737ee820ec Pavel Shilovsky 2012-09-18  3020  		buf->EndOfFile = rsp->EndofFile;
f0df737ee820ec Pavel Shilovsky 2012-09-18  3021  		buf->Attributes = rsp->FileAttributes;
f0df737ee820ec Pavel Shilovsky 2012-09-18  3022  		buf->NumberOfLinks = cpu_to_le32(1);
f0df737ee820ec Pavel Shilovsky 2012-09-18  3023  		buf->DeletePending = 0;
f0df737ee820ec Pavel Shilovsky 2012-09-18  3024  	}
2e44b288788213 Pavel Shilovsky 2012-09-18  3025  
89a5bfa350faf8 Steve French    2019-07-18  3026  
89a5bfa350faf8 Steve French    2019-07-18  3027  	smb2_parse_contexts(server, rsp, &oparms->fid->epoch,
69dda3059e7a4d Aurelien Aptel  2020-03-02  3028  			    oparms->fid->lease_key, oplock, buf, posix);
2503a0dba98948 Pavel Shilovsky 2011-12-26  3029  creat_exit:
1eb9fb52040fc6 Ronnie Sahlberg 2018-08-08  3030  	SMB2_open_free(&rqst);
2503a0dba98948 Pavel Shilovsky 2011-12-26 @3031  	free_rsp_buf(resp_buftype, rsp);
2503a0dba98948 Pavel Shilovsky 2011-12-26  3032  	return rc;
2503a0dba98948 Pavel Shilovsky 2011-12-26  3033  }
2503a0dba98948 Pavel Shilovsky 2011-12-26  3034  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

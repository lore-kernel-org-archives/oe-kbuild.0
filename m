Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099142AA6
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762068671; cv=none; b=Bz/VCYDN1AZubzzFzLsXYSaE3Kjj8SBYkGHJNrBcZKZHJ0nm9paleCP06z+ntHBk6dx9pS77WH4aiwyk5aqbRZY47xbMZLshgnM1e7NvJh3ykff6hzcL7Pw1u9N8eK6cSqV1DXXjP9XXTAsOgpc8UM/iUy/Mm2K1ozyuXy+b5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762068671; c=relaxed/simple;
	bh=g+piCK+mnthYIktoW2+0nOHtewrLjNUjiYgL4vcI36c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqsuP0XiUXyCOm747uT+sTvEA8WeewFeLxn4Dn4Op3coFgCsSybL/XsyYVDmAv5RWM8Bh62uWD9Yr2V4N43bpDTQNnZA+94dSVzb3koxyIrNGSYq+6g7yBE9zU3JtAl9FdvAn4BHEpEJvk9CZggQcsPVdiBEQbnasqVl64qEkIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmQS3fjt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmQS3fjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762068669; x=1793604669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+piCK+mnthYIktoW2+0nOHtewrLjNUjiYgL4vcI36c=;
  b=bmQS3fjtSGH7njJstZNZC/+t6c7lEdIXHagkVGimuAuuAjG/SnvJE4g/
   z6L3xp8xjGSeEMHQs+iyat/ofUCWxz899Ipab7WTbI2MJEOCSI7tNYgd7
   IBXgM721Cs4zRepwqU9F6T5uyaO/Dts9R9+IjwuHgpE3z4swOrc9WPvE6
   isNOeBQKdWLevZ2CQDMpC3lBXeF8ESgyjNIknRySZGWrTVzxs3yjwAEJx
   2FccOCBUUXwf/lnQC6f80ooJtZco4QprQym+KzjZrVH/Wh1IIEe+DZhLw
   /YMZejV4bTpR9zpePSPKred1NtJonLKSVwGwa9i5+I75rZR6x+pAt0BiA
   Q==;
X-CSE-ConnectionGUID: GuvYgHsISFSLXIVoAfUlXg==
X-CSE-MsgGUID: oa8DTX/XRDWHQRRUon2Zdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="75288493"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="75288493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 00:31:07 -0700
X-CSE-ConnectionGUID: aY4vDejnQgaovi3b2HVAlQ==
X-CSE-MsgGUID: 8OEcsPNTRxW4/9/l5jNOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186909411"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2025 00:31:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFSYI-000P3x-35;
	Sun, 02 Nov 2025 07:31:02 +0000
Date: Sun, 2 Nov 2025 15:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating()
 and end_creating()
Message-ID: <202511021406.Tv3dcpn5-lkp@intel.com>
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
In-Reply-To: <20251029234353.1321957-5-neilb@ownmail.net>
References: <20251029234353.1321957-5-neilb@ownmail.net>
TO: NeilBrown <neilb@ownmail.net>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
TO: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>
CC: linux-fsdevel@vger.kernel.org
CC: Jeff Layton <jlayton@kernel.org>
CC: Chris Mason <chris.mason@fusionio.com>
CC: David Sterba <dsterba@suse.com>
CC: David Howells <dhowells@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>
CC: Tyler Hicks <code@tyhicks.com>
CC: Miklos Szeredi <miklos@szeredi.hu>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Olga Kornievskaia <okorniev@redhat.com>
CC: Dai Ngo <Dai.Ngo@oracle.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <smfrench@gmail.com>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Carlos Maiolino <cem@kernel.org>
CC: John Johansen <john.johansen@canonical.com>
CC: Paul Moore <paul@paul-moore.com>
CC: James Morris <jmorris@namei.org>
CC: "Serge E. Hallyn" <serge@hallyn.com>
CC: Stephen Smalley <stephen.smalley.work@gmail.com>
CC: Ondrej Mosnacek <omosnace@redhat.com>
CC: Mateusz Guzik <mjguzik@gmail.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Stefan Berger <stefanb@linux.ibm.com>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus xfs-linux/for-next kdave/for-next linus/master v6.18-rc3 next-20251031]
[cannot apply to viro-vfs/for-next brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20251030-075146
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%40ownmail.net
patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and end_creating()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/

smatch warnings:
fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteout'.
fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'

vim +/whiteout +130 fs/overlayfs/dir.c

807b78b0fffc23 NeilBrown         2025-10-30   96  
c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24   99  	int err;
807b78b0fffc23 NeilBrown         2025-10-30  100  	struct dentry *whiteout, *link;
c21c839b8448dd Chengguang Xu     2020-04-24  101  	struct dentry *workdir = ofs->workdir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
8afa0a73671389 NeilBrown         2025-07-16  104  	guard(mutex)(&ofs->whiteout_lock);
8afa0a73671389 NeilBrown         2025-07-16  105  
c21c839b8448dd Chengguang Xu     2020-04-24  106  	if (!ofs->whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  107  		whiteout = ovl_start_creating_temp(ofs, workdir);
8afa0a73671389 NeilBrown         2025-07-16  108  		if (IS_ERR(whiteout))
8afa0a73671389 NeilBrown         2025-07-16  109  			return whiteout;
807b78b0fffc23 NeilBrown         2025-10-30  110  		err = ovl_do_whiteout(ofs, wdir, whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  111  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  112  			ofs->whiteout = dget(whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  113  		end_creating(whiteout, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  114  		if (err)
807b78b0fffc23 NeilBrown         2025-10-30  115  			return ERR_PTR(err);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  116  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  117  
e4599d4b1aeff0 Amir Goldstein    2023-06-17  118  	if (!ofs->no_shared_whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  119  		link = ovl_start_creating_temp(ofs, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  120  		if (IS_ERR(link))
807b78b0fffc23 NeilBrown         2025-10-30  121  			return link;
807b78b0fffc23 NeilBrown         2025-10-30  122  		err = ovl_do_link(ofs, ofs->whiteout, wdir, link);
807b78b0fffc23 NeilBrown         2025-10-30  123  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  124  			whiteout = dget(link);
807b78b0fffc23 NeilBrown         2025-10-30  125  		end_creating(link, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  126  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  127  			return whiteout;;
807b78b0fffc23 NeilBrown         2025-10-30  128  
807b78b0fffc23 NeilBrown         2025-10-30  129  		if (err != -EMLINK) {
672820a070ea5e Antonio Quartulli 2025-07-21 @130  			pr_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=%u, err=%lu)\n",
672820a070ea5e Antonio Quartulli 2025-07-21  131  				ofs->whiteout->d_inode->i_nlink,
672820a070ea5e Antonio Quartulli 2025-07-21  132  				PTR_ERR(whiteout));
e4599d4b1aeff0 Amir Goldstein    2023-06-17  133  			ofs->no_shared_whiteout = true;
c21c839b8448dd Chengguang Xu     2020-04-24  134  		}
c21c839b8448dd Chengguang Xu     2020-04-24  135  	}
c21c839b8448dd Chengguang Xu     2020-04-24  136  	whiteout = ofs->whiteout;
c21c839b8448dd Chengguang Xu     2020-04-24  137  	ofs->whiteout = NULL;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  138  	return whiteout;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  139  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

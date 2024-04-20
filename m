Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA38F9DE
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Apr 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713598130; cv=none; b=hngEITXPwSxvZwFwBRtPnQ/xmM2pKb6HHHjlleSSdfwvhvgtm9Tadwy60oi0jVAE9CH/GkBwhUlNnnJt6WoXA/QVTEQVBE62+2WMb0dLyB1JGcUcVGpWPQLH6YCAHc3SsxD5KPXhXOKW7/nLMKOAaA1xY2n4PRiHb6+NAWUN1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713598130; c=relaxed/simple;
	bh=bFo4s9SZL4rxVFtxW0ponOoHT38LjyJCrgCdjHcPvao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MmbkWsjrdELpB2enpyGgosCtOhQKmO68e1XdQ273lPuwIqEgdKwr+2SHpzm2SXvtDFOC+SEaq7D/ZDDGUSVparG/QsROAvFmQFrsR1GYETN9BUC44OTeSRu2eIkSEGfi8M5h8Ok4HhjjjhhmLySNS7xl2E0qbN/OELgSiCv7HRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDHVOE98; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDHVOE98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713598128; x=1745134128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bFo4s9SZL4rxVFtxW0ponOoHT38LjyJCrgCdjHcPvao=;
  b=SDHVOE982/EAe1BP+oc9FQsmuEfD03mC9v8JoWtsdCoo/5qBmZo3SSGK
   oBnoDy8dD/EzqKtf1bBJejVgqoN966wIfq2EiWrQ384luaOFGyWOHDId9
   CEZWTrSwRpAZZsFaTtulFeE0Skkj11S2unMKxZ+fRjsWDp0fNHBiRE7Tp
   jY8OoPrsJP8v77eBr5GltMWQZIeyaepzN3wC/SXUk8bDWFkiGuU7J+1M7
   gt9rtoAc4p3WkHHjlphe0gki+ShbkV3EKEWFLLn0vhh6kOHIVijqKT8Fn
   PmdO1/NgbU/JwTHxvIDNgGf6X7tk0vg5XpYyubPNkiMQ0lA70TI14wnJf
   g==;
X-CSE-ConnectionGUID: NG6oxgxBSmyMOq9WbD5kgA==
X-CSE-MsgGUID: KJQtqeaORMCiHfIqmUeRaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26725358"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="26725358"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 00:28:47 -0700
X-CSE-ConnectionGUID: 11kmKnFLR8qrIoU7mRX8Hw==
X-CSE-MsgGUID: l/oQoxkuQGmfeqQNHxWzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="28003806"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2024 00:28:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry59P-000Aps-1M;
	Sat, 20 Apr 2024 07:28:43 +0000
Date: Sat, 20 Apr 2024 15:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:for-next 34/51] sound/usb/mixer_scarlett2.c:3690
 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.
Message-ID: <202404201509.mWdaL3xF-lkp@intel.com>
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
CC: alsa-devel@alsa-project.org
TO: "Geoffrey D. Bennett" <g@b4.vu>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   32cb23a0f911317cdb5030035e49a204aa86fef5
commit: e30ea5340c25d41484d551f61d8c93106989019b [34/51] ALSA: scarlett2: Add autogain target controls
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: csky-randconfig-r081-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201509.mWdaL3xF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404201509.mWdaL3xF-lkp@intel.com/

New smatch warnings:
sound/usb/mixer_scarlett2.c:3690 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.

Old smatch warnings:
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.

vim +/err +3690 sound/usb/mixer_scarlett2.c

e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3664  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3665  static int scarlett2_ag_target_ctl_get(
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3666  	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3667  {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3668  	struct usb_mixer_elem_info *elem = kctl->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3669  	struct usb_mixer_interface *mixer = elem->head.mixer;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3670  	struct scarlett2_data *private = mixer->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3671  	int err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3672  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3673  	mutex_lock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3674  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3675  	if (private->hwdep_in_use) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3676  		err = -EBUSY;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3677  		goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3678  	}
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3679  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3680  	if (private->autogain_updated) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3681  		err = scarlett2_update_autogain(mixer);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3682  		if (err < 0)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3683  			goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3684  	}
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3685  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3686  	ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3687  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3688  unlock:
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3689  	mutex_unlock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13 @3690  	return err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3691  }
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3692  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

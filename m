Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2139AD27
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685088806; x=1716624806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WTjVTxcji+VBOvSG27R2IcvLhlnobNSOMiEkAhjruk=;
  b=Y4r2JxU1970dP6kBnNJbY979c8hLWpPMUrx0ELnb9+nJdQmtt+3SF24D
   ks2FHIJN1oRszI+yFZpO1GLqd9MsaxfgJ87rMhnpf+1StfbvRsW+XuYwT
   aykUWRqpS9xsgO31OXaai0lpsaILUpO+F0iUpzNVfL2SeA2IJyBj8kV1z
   A9JAqwY1YSYGGef7ypiZJOWKEcph2pVgg0LbOZsVajCtQJrmfO6thUeG+
   4cqdW4UpV2DHZYa7vPFOTP+h5BymrMzQ+TdGVkbuvg5r6+Q/UNsvXVMlT
   JgK4V+4T9Nkz0JcBH2MX3u/ObjegCbAKX5qMqZzMdSLWwzriOnRfNKULR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352990654"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="352990654"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 01:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770262702"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="770262702"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 May 2023 01:13:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2SZf-000JBE-13;
	Fri, 26 May 2023 08:13:23 +0000
Date: Fri, 26 May 2023 16:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:topic/midi20 34/40] sound/core/seq/seq_clientmgr.c:2160
 snd_seq_ioctl_client_ump_info() warn: potential spectre issue
 'cptr->ump_info' [r] (local cap)
Message-ID: <202305261642.d8KfrU35-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: d2d247e35eeea8331150d7708211a013aabccb5b [34/40] ALSA: seq: Add ioctls for client UMP info query and setup
:::::: branch date: 24 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261642.d8KfrU35-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305261642.d8KfrU35-lkp@intel.com/

New smatch warnings:
sound/core/seq/seq_clientmgr.c:2160 snd_seq_ioctl_client_ump_info() warn: potential spectre issue 'cptr->ump_info' [r] (local cap)
sound/core/seq/seq_clientmgr.c:2161 snd_seq_ioctl_client_ump_info() warn: possible spectre second half.  'p'

Old smatch warnings:
sound/core/seq/seq_clientmgr.c:492 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)

vim +2160 sound/core/seq/seq_clientmgr.c

d2d247e35eeea8 Takashi Iwai 2023-05-23  2122  
d2d247e35eeea8 Takashi Iwai 2023-05-23  2123  /* UMP-specific ioctls -- called directly without data copy */
d2d247e35eeea8 Takashi Iwai 2023-05-23  2124  static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
d2d247e35eeea8 Takashi Iwai 2023-05-23  2125  					 unsigned int cmd,
d2d247e35eeea8 Takashi Iwai 2023-05-23  2126  					 unsigned long arg)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2127  {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2128  	struct snd_seq_client_ump_info __user *argp =
d2d247e35eeea8 Takashi Iwai 2023-05-23  2129  		(struct snd_seq_client_ump_info __user *)arg;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2130  	struct snd_seq_client *cptr;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2131  	int client, type, err = 0;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2132  	size_t size;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2133  	void *p;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2134  
d2d247e35eeea8 Takashi Iwai 2023-05-23  2135  	if (get_user(client, &argp->client) || get_user(type, &argp->type))
d2d247e35eeea8 Takashi Iwai 2023-05-23  2136  		return -EFAULT;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2137  	if (cmd == SNDRV_SEQ_IOCTL_SET_CLIENT_UMP_INFO &&
d2d247e35eeea8 Takashi Iwai 2023-05-23  2138  	    caller->number != client)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2139  		return -EPERM;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2140  	if (type < 0 || type >= NUM_UMP_INFOS)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2141  		return -EINVAL;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2142  	if (type == SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2143  		size = sizeof(struct snd_ump_endpoint_info);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2144  	else
d2d247e35eeea8 Takashi Iwai 2023-05-23  2145  		size = sizeof(struct snd_ump_block_info);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2146  	cptr = snd_seq_client_use_ptr(client);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2147  	if (!cptr)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2148  		return -ENOENT;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2149  
d2d247e35eeea8 Takashi Iwai 2023-05-23  2150  	mutex_lock(&cptr->ioctl_mutex);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2151  	if (!cptr->midi_version) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2152  		err = -EBADFD;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2153  		goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2154  	}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2155  
d2d247e35eeea8 Takashi Iwai 2023-05-23  2156  	if (cmd == SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2157  		if (!cptr->ump_info)
d2d247e35eeea8 Takashi Iwai 2023-05-23  2158  			p = NULL;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2159  		else
d2d247e35eeea8 Takashi Iwai 2023-05-23 @2160  			p = cptr->ump_info[type];
d2d247e35eeea8 Takashi Iwai 2023-05-23 @2161  		if (!p) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2162  			err = -ENODEV;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2163  			goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2164  		}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2165  		if (copy_to_user(argp->info, p, size)) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2166  			err = -EFAULT;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2167  			goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2168  		}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2169  	} else {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2170  		if (cptr->type != USER_CLIENT) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2171  			err = -EBADFD;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2172  			goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2173  		}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2174  		if (!cptr->ump_info) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2175  			cptr->ump_info = kcalloc(NUM_UMP_INFOS,
d2d247e35eeea8 Takashi Iwai 2023-05-23  2176  						 sizeof(void *), GFP_KERNEL);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2177  			if (!cptr->ump_info) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2178  				err = -ENOMEM;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2179  				goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2180  			}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2181  		}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2182  		p = memdup_user(argp->info, size);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2183  		if (IS_ERR(p)) {
d2d247e35eeea8 Takashi Iwai 2023-05-23  2184  			err = PTR_ERR(p);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2185  			goto error;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2186  		}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2187  		kfree(cptr->ump_info[type]);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2188  		terminate_ump_info_strings(p, type);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2189  		cptr->ump_info[type] = p;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2190  	}
d2d247e35eeea8 Takashi Iwai 2023-05-23  2191  
d2d247e35eeea8 Takashi Iwai 2023-05-23  2192   error:
d2d247e35eeea8 Takashi Iwai 2023-05-23  2193  	mutex_unlock(&cptr->ioctl_mutex);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2194  	snd_seq_client_unlock(cptr);
d2d247e35eeea8 Takashi Iwai 2023-05-23  2195  	return err;
d2d247e35eeea8 Takashi Iwai 2023-05-23  2196  }
d2d247e35eeea8 Takashi Iwai 2023-05-23  2197  #endif
d2d247e35eeea8 Takashi Iwai 2023-05-23  2198  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984061420CC
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718101037; cv=none; b=Kv1gzeF2AapFkgiFOxkDAqW3et0bt+D10JBnnel5WzYf5A9qDWWpPuAVRqfm2gIdp6PTQw+NdFj/GzGrnITgvgM5QIjI70MvUphXdILuH9q2gacV6gna9GDd13GXUUg8Usq2+c9JKNFKOIoQpKJK31Il7HHeky+KyJqJX9Si6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718101037; c=relaxed/simple;
	bh=J7VIhdf6enzWpXaPhJvjgTU7mdtr0wnX9YGk8jCtYK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8ay0RHY00uP8fYj1r7DTmVqpR1R+tTLDL9s5O/wX6m6t6T0FHTD7rY1sv4KKeZ1X4rdnFiSMwfUbRjiKwEAtnc2+egdKtE8GwOWfCorh9lHzP9co2FrSaQPoc55E/6S3b7HNfOU1aA5746BKjWDMtb5oV/5mcR7f7dis0bAyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7I0C7Xk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7I0C7Xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718101036; x=1749637036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7VIhdf6enzWpXaPhJvjgTU7mdtr0wnX9YGk8jCtYK4=;
  b=C7I0C7XkOfesKiGb5imcI6tWebN/bk+qeuHNgSfzusZoCTb5URP+Bmkg
   HnIh7Ga3EkI1WLELcUxqtP1Qgz+B6Raa+cGYe/0ahl1EpCIVUngyBim07
   8EINybcuGfvappLDc9aPHk86WDu+XL3icsMB6yZHbVSOv6HJwXraEd5FO
   yr296EICdy8PvVgjtARsTGDTasPObVE5Lx16PiOMDWuZTUqmnh4eSrK5l
   3s5pxxM4Ibysa2y5bQ70fX9SEMfb99q8OQAplHeZkq5W2U2xyEcywssa5
   T+k7d94D70mhwnZ1Wull7sD9uKcXs9tC3tHuXfiZBop26xyzjjvxpgv+3
   w==;
X-CSE-ConnectionGUID: h1MPBdV5SLO0qnXh18/NeQ==
X-CSE-MsgGUID: JMxsDm6KQL+dN3eK9hTSaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32340619"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="32340619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 03:17:15 -0700
X-CSE-ConnectionGUID: tUvG0oLYTvOsRR9Usn4cVw==
X-CSE-MsgGUID: N3FYzZbyTNaRNJ7lRB+ERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="44302546"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2024 03:17:14 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGyYx-0000IY-0O;
	Tue, 11 Jun 2024 10:17:11 +0000
Date: Tue, 11 Jun 2024 18:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <202406111750.AXBfJUS3-lkp@intel.com>
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
In-Reply-To: <ZmYlfKDm5sgB44EU@google.com>
References: <ZmYlfKDm5sgB44EU@google.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: linux-input@vger.kernel.org
CC: Artur Rojek <contact@artur-rojek.eu>
CC: Chris Morgan <macromorgan@hotmail.com>
CC: linux-kernel@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on next-20240611]
[cannot apply to dtor-input/for-linus hid/for-next linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-adc-joystick-move-axes-data-into-the-main-structure/20240610-060124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/ZmYlfKDm5sgB44EU%40google.com
patch subject: [PATCH] Input: adc-joystick - move axes data into the main structure
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111750.AXBfJUS3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406111750.AXBfJUS3-lkp@intel.com/

smatch warnings:
drivers/input/joystick/adc-joystick.c:166 adc_joystick_set_axes() error: uninitialized symbol 'axes'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() error: uninitialized symbol 'joy'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() warn: passing zero to 'PTR_ERR'

vim +/axes +166 drivers/input/joystick/adc-joystick.c

2c2b364fddd551 Artur Rojek     2020-09-28  131  
2c2b364fddd551 Artur Rojek     2020-09-28  132  static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
2c2b364fddd551 Artur Rojek     2020-09-28  133  {
2c2b364fddd551 Artur Rojek     2020-09-28  134  	struct adc_joystick_axis *axes;
2c2b364fddd551 Artur Rojek     2020-09-28  135  	struct fwnode_handle *child;
815b74328f141f Dmitry Torokhov 2024-06-09  136  	s32 range[2], fuzz, flat;
815b74328f141f Dmitry Torokhov 2024-06-09  137  	unsigned int num_axes;
815b74328f141f Dmitry Torokhov 2024-06-09  138  	int error, i;
2c2b364fddd551 Artur Rojek     2020-09-28  139  
2c2b364fddd551 Artur Rojek     2020-09-28  140  	num_axes = device_get_child_node_count(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  141  	if (!num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  142  		dev_err(dev, "Unable to find child nodes\n");
2c2b364fddd551 Artur Rojek     2020-09-28  143  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  144  	}
2c2b364fddd551 Artur Rojek     2020-09-28  145  
2c2b364fddd551 Artur Rojek     2020-09-28  146  	if (num_axes != joy->num_chans) {
2c2b364fddd551 Artur Rojek     2020-09-28  147  		dev_err(dev, "Got %d child nodes for %d channels\n",
2c2b364fddd551 Artur Rojek     2020-09-28  148  			num_axes, joy->num_chans);
2c2b364fddd551 Artur Rojek     2020-09-28  149  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  150  	}
2c2b364fddd551 Artur Rojek     2020-09-28  151  
2c2b364fddd551 Artur Rojek     2020-09-28  152  	device_for_each_child_node(dev, child) {
2c2b364fddd551 Artur Rojek     2020-09-28  153  		error = fwnode_property_read_u32(child, "reg", &i);
2c2b364fddd551 Artur Rojek     2020-09-28  154  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  155  			dev_err(dev, "reg invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  156  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  157  		}
2c2b364fddd551 Artur Rojek     2020-09-28  158  
2c2b364fddd551 Artur Rojek     2020-09-28  159  		if (i >= num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  160  			error = -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  161  			dev_err(dev, "No matching axis for reg %d\n", i);
2c2b364fddd551 Artur Rojek     2020-09-28  162  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  163  		}
2c2b364fddd551 Artur Rojek     2020-09-28  164  
2c2b364fddd551 Artur Rojek     2020-09-28  165  		error = fwnode_property_read_u32(child, "linux,code",
2c2b364fddd551 Artur Rojek     2020-09-28 @166  						 &axes[i].code);
2c2b364fddd551 Artur Rojek     2020-09-28  167  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  168  			dev_err(dev, "linux,code invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  169  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  170  		}
2c2b364fddd551 Artur Rojek     2020-09-28  171  
2c2b364fddd551 Artur Rojek     2020-09-28  172  		error = fwnode_property_read_u32_array(child, "abs-range",
815b74328f141f Dmitry Torokhov 2024-06-09  173  						       range, 2);
2c2b364fddd551 Artur Rojek     2020-09-28  174  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  175  			dev_err(dev, "abs-range invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  176  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  177  		}
2c2b364fddd551 Artur Rojek     2020-09-28  178  
815b74328f141f Dmitry Torokhov 2024-06-09  179  		if (range[0] > range[1]) {
6560cfcfb46511 Chris Morgan    2024-01-19  180  			dev_dbg(dev, "abs-axis %d inverted\n", i);
6560cfcfb46511 Chris Morgan    2024-01-19  181  			axes[i].inverted = true;
815b74328f141f Dmitry Torokhov 2024-06-09  182  			swap(range[0], range[1]);
6560cfcfb46511 Chris Morgan    2024-01-19  183  		}
6560cfcfb46511 Chris Morgan    2024-01-19  184  
815b74328f141f Dmitry Torokhov 2024-06-09  185  		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
815b74328f141f Dmitry Torokhov 2024-06-09  186  		fwnode_property_read_u32(child, "abs-flat", &flat);
2c2b364fddd551 Artur Rojek     2020-09-28  187  
2c2b364fddd551 Artur Rojek     2020-09-28  188  		input_set_abs_params(joy->input, axes[i].code,
815b74328f141f Dmitry Torokhov 2024-06-09  189  				     range[0], range[1], fuzz, flat);
2c2b364fddd551 Artur Rojek     2020-09-28  190  	}
2c2b364fddd551 Artur Rojek     2020-09-28  191  
2c2b364fddd551 Artur Rojek     2020-09-28  192  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  193  
2c2b364fddd551 Artur Rojek     2020-09-28  194  err_fwnode_put:
2c2b364fddd551 Artur Rojek     2020-09-28  195  	fwnode_handle_put(child);
2c2b364fddd551 Artur Rojek     2020-09-28  196  	return error;
2c2b364fddd551 Artur Rojek     2020-09-28  197  }
2c2b364fddd551 Artur Rojek     2020-09-28  198  
815b74328f141f Dmitry Torokhov 2024-06-09  199  
815b74328f141f Dmitry Torokhov 2024-06-09  200  /*
815b74328f141f Dmitry Torokhov 2024-06-09  201   * Count how many channels we got. NULL terminated.
815b74328f141f Dmitry Torokhov 2024-06-09  202   * Do not check the storage size if using polling.
815b74328f141f Dmitry Torokhov 2024-06-09  203   */
815b74328f141f Dmitry Torokhov 2024-06-09  204  static int adc_joystick_count_channels(struct device *dev,
815b74328f141f Dmitry Torokhov 2024-06-09  205  				       const struct iio_channel *chans,
815b74328f141f Dmitry Torokhov 2024-06-09  206  				       bool polled,
815b74328f141f Dmitry Torokhov 2024-06-09  207  				       unsigned int *num_chans)
815b74328f141f Dmitry Torokhov 2024-06-09  208  {
815b74328f141f Dmitry Torokhov 2024-06-09  209  	int bits;
815b74328f141f Dmitry Torokhov 2024-06-09  210  	int i;
815b74328f141f Dmitry Torokhov 2024-06-09  211  
815b74328f141f Dmitry Torokhov 2024-06-09  212  	for (i = 0; chans[i].indio_dev; i++) {
815b74328f141f Dmitry Torokhov 2024-06-09  213  		if (polled)
815b74328f141f Dmitry Torokhov 2024-06-09  214  			continue;
815b74328f141f Dmitry Torokhov 2024-06-09  215  		bits = chans[i].channel->scan_type.storagebits;
815b74328f141f Dmitry Torokhov 2024-06-09  216  		if (!bits || bits > 16) {
815b74328f141f Dmitry Torokhov 2024-06-09  217  			dev_err(dev, "Unsupported channel storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  218  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  219  		}
815b74328f141f Dmitry Torokhov 2024-06-09  220  		if (bits != chans[0].channel->scan_type.storagebits) {
815b74328f141f Dmitry Torokhov 2024-06-09  221  			dev_err(dev, "Channels must have equal storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  222  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  223  		}
815b74328f141f Dmitry Torokhov 2024-06-09  224  	}
815b74328f141f Dmitry Torokhov 2024-06-09  225  
815b74328f141f Dmitry Torokhov 2024-06-09  226  	return i;
815b74328f141f Dmitry Torokhov 2024-06-09  227  }
815b74328f141f Dmitry Torokhov 2024-06-09  228  
2c2b364fddd551 Artur Rojek     2020-09-28  229  static int adc_joystick_probe(struct platform_device *pdev)
2c2b364fddd551 Artur Rojek     2020-09-28  230  {
2c2b364fddd551 Artur Rojek     2020-09-28  231  	struct device *dev = &pdev->dev;
815b74328f141f Dmitry Torokhov 2024-06-09  232  	struct iio_channel *chans;
2c2b364fddd551 Artur Rojek     2020-09-28  233  	struct adc_joystick *joy;
2c2b364fddd551 Artur Rojek     2020-09-28  234  	struct input_dev *input;
815b74328f141f Dmitry Torokhov 2024-06-09  235  	unsigned int poll_interval = 0;
815b74328f141f Dmitry Torokhov 2024-06-09  236  	unsigned int num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  237  	int error;
2c2b364fddd551 Artur Rojek     2020-09-28  238  
815b74328f141f Dmitry Torokhov 2024-06-09  239  	chans = devm_iio_channel_get_all(dev);
815b74328f141f Dmitry Torokhov 2024-06-09  240  	if (IS_ERR(chans)) {
2c2b364fddd551 Artur Rojek     2020-09-28 @241  		error = PTR_ERR(joy->chans);
2c2b364fddd551 Artur Rojek     2020-09-28  242  		if (error != -EPROBE_DEFER)
2c2b364fddd551 Artur Rojek     2020-09-28  243  			dev_err(dev, "Unable to get IIO channels");
2c2b364fddd551 Artur Rojek     2020-09-28  244  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  245  	}
2c2b364fddd551 Artur Rojek     2020-09-28  246  
24c06e000e8fa2 Chris Morgan    2022-08-16  247  	error = device_property_read_u32(dev, "poll-interval", &poll_interval);
24c06e000e8fa2 Chris Morgan    2022-08-16  248  	if (error) {
24c06e000e8fa2 Chris Morgan    2022-08-16  249  		/* -EINVAL means the property is absent. */
24c06e000e8fa2 Chris Morgan    2022-08-16  250  		if (error != -EINVAL)
24c06e000e8fa2 Chris Morgan    2022-08-16  251  			return error;
24c06e000e8fa2 Chris Morgan    2022-08-16  252  	} else if (poll_interval == 0) {
24c06e000e8fa2 Chris Morgan    2022-08-16  253  		dev_err(dev, "Unable to get poll-interval\n");
24c06e000e8fa2 Chris Morgan    2022-08-16  254  		return -EINVAL;
24c06e000e8fa2 Chris Morgan    2022-08-16  255  	}
24c06e000e8fa2 Chris Morgan    2022-08-16  256  
815b74328f141f Dmitry Torokhov 2024-06-09  257  	error = adc_joystick_count_channels(dev, chans, poll_interval != 0,
815b74328f141f Dmitry Torokhov 2024-06-09  258  					    &num_chans);
815b74328f141f Dmitry Torokhov 2024-06-09  259  	if (error)
815b74328f141f Dmitry Torokhov 2024-06-09  260  		return error;
815b74328f141f Dmitry Torokhov 2024-06-09  261  
815b74328f141f Dmitry Torokhov 2024-06-09  262  	joy = devm_kzalloc(dev, struct_size(joy, axes, num_chans), GFP_KERNEL);
815b74328f141f Dmitry Torokhov 2024-06-09  263  	if (!joy)
815b74328f141f Dmitry Torokhov 2024-06-09  264  		return -ENOMEM;
815b74328f141f Dmitry Torokhov 2024-06-09  265  
815b74328f141f Dmitry Torokhov 2024-06-09  266  	joy->chans = chans;
815b74328f141f Dmitry Torokhov 2024-06-09  267  	joy->num_chans = num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  268  
2c2b364fddd551 Artur Rojek     2020-09-28  269  	input = devm_input_allocate_device(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  270  	if (!input) {
2c2b364fddd551 Artur Rojek     2020-09-28  271  		dev_err(dev, "Unable to allocate input device\n");
2c2b364fddd551 Artur Rojek     2020-09-28  272  		return -ENOMEM;
2c2b364fddd551 Artur Rojek     2020-09-28  273  	}
2c2b364fddd551 Artur Rojek     2020-09-28  274  
2c2b364fddd551 Artur Rojek     2020-09-28  275  	joy->input = input;
2c2b364fddd551 Artur Rojek     2020-09-28  276  	input->name = pdev->name;
2c2b364fddd551 Artur Rojek     2020-09-28  277  	input->id.bustype = BUS_HOST;
2c2b364fddd551 Artur Rojek     2020-09-28  278  
2c2b364fddd551 Artur Rojek     2020-09-28  279  	error = adc_joystick_set_axes(dev, joy);
2c2b364fddd551 Artur Rojek     2020-09-28  280  	if (error)
2c2b364fddd551 Artur Rojek     2020-09-28  281  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  282  
815b74328f141f Dmitry Torokhov 2024-06-09  283  	if (poll_interval != 0) {
24c06e000e8fa2 Chris Morgan    2022-08-16  284  		input_setup_polling(input, adc_joystick_poll);
24c06e000e8fa2 Chris Morgan    2022-08-16  285  		input_set_poll_interval(input, poll_interval);
24c06e000e8fa2 Chris Morgan    2022-08-16  286  	} else {
24c06e000e8fa2 Chris Morgan    2022-08-16  287  		input->open = adc_joystick_open;
24c06e000e8fa2 Chris Morgan    2022-08-16  288  		input->close = adc_joystick_close;
24c06e000e8fa2 Chris Morgan    2022-08-16  289  
24c06e000e8fa2 Chris Morgan    2022-08-16  290  		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle,
24c06e000e8fa2 Chris Morgan    2022-08-16  291  						     joy);
2c2b364fddd551 Artur Rojek     2020-09-28  292  		if (IS_ERR(joy->buffer)) {
2c2b364fddd551 Artur Rojek     2020-09-28  293  			dev_err(dev, "Unable to allocate callback buffer\n");
2c2b364fddd551 Artur Rojek     2020-09-28  294  			return PTR_ERR(joy->buffer);
2c2b364fddd551 Artur Rojek     2020-09-28  295  		}
2c2b364fddd551 Artur Rojek     2020-09-28  296  
24c06e000e8fa2 Chris Morgan    2022-08-16  297  		error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
24c06e000e8fa2 Chris Morgan    2022-08-16  298  						 joy->buffer);
2c2b364fddd551 Artur Rojek     2020-09-28  299  		if (error)  {
2c2b364fddd551 Artur Rojek     2020-09-28  300  			dev_err(dev, "Unable to add action\n");
2c2b364fddd551 Artur Rojek     2020-09-28  301  			return error;
2c2b364fddd551 Artur Rojek     2020-09-28  302  		}
24c06e000e8fa2 Chris Morgan    2022-08-16  303  	}
2c2b364fddd551 Artur Rojek     2020-09-28  304  
7c744d00990ea9 Dmitry Torokhov 2022-08-02  305  	input_set_drvdata(input, joy);
7c744d00990ea9 Dmitry Torokhov 2022-08-02  306  
7c744d00990ea9 Dmitry Torokhov 2022-08-02  307  	error = input_register_device(input);
7c744d00990ea9 Dmitry Torokhov 2022-08-02  308  	if (error) {
7c744d00990ea9 Dmitry Torokhov 2022-08-02  309  		dev_err(dev, "Unable to register input device\n");
7c744d00990ea9 Dmitry Torokhov 2022-08-02  310  		return error;
7c744d00990ea9 Dmitry Torokhov 2022-08-02  311  	}
7c744d00990ea9 Dmitry Torokhov 2022-08-02  312  
2c2b364fddd551 Artur Rojek     2020-09-28  313  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  314  }
2c2b364fddd551 Artur Rojek     2020-09-28  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

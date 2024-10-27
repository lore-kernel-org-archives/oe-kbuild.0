Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F318F62
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729988438; cv=none; b=Om9g4jD3uBpagBjmfZS1gDD0LOXplgrfPXWebU+F3kFZfj0ViVDVe5H0TG0hWTGJue+ksgvzhoJKweqSqnpSpuywNNYNB3JUEyjMQZZZg4/4JxrKWWibGQqfCbUcVZ1LoHdO0LOEDYS/ChhQfaWLXRs4HVDBuIj03XyJL14zv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729988438; c=relaxed/simple;
	bh=8DJV0sNuR44hH5+pLWTUalCyh+D23txk7g1FcEyrZvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3Nw0VMa9xI34cXt1XtPAcOutTc0ncclRYXl01n7v+/I0qjEOyWtP7+ielp5foFoJ2V//G0ES7bUIxktZBz+v4M+taYEuSZYNbgfuC7tYtYdzQ6l65Lahky9P+5t4x2zQAXUAwISmZo4tMMUvRt5L4zW0sKbOyV8Az7g7CikE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrlAMZif; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrlAMZif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729988436; x=1761524436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DJV0sNuR44hH5+pLWTUalCyh+D23txk7g1FcEyrZvg=;
  b=TrlAMZifwuTRr6MPk6BmYlWpBE8IOJHNfs1BBCqYnr10VqGqj2bR99tZ
   fm1vwDQNsGaaix8Iw3fv8LkeLDW6U9g2nsaSZhKvFyYt/a+moWRLp9nzO
   y+96pr25Sm8CcKdPpo8F9Hf5+1BDpMDD9AbYjJtrbBD+mboJqkHirw6vz
   zFVyIULkNvmVTzYUDuZFJbEDHtOqPZwmT5xYkXxuEy3Sh0XC0i8JoqfjK
   9b1AJvJamF+G0BYSWBcdOCvkIrXkdrjI9IIxVAP8bqsdQcY1fX0/SnmM3
   wyXaznO0ypK50P1oxht0EMev9NUzG4gFVlLcahQ2ngqj/nGbzksVwOC4G
   w==;
X-CSE-ConnectionGUID: pNagFpe+RGOutoK/QeFadQ==
X-CSE-MsgGUID: VUSCb9JOSlutCROg7JYlwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29840924"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29840924"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 17:20:32 -0700
X-CSE-ConnectionGUID: YFfigcCWRVC8W2MdjDHo6Q==
X-CSE-MsgGUID: I9k+hogbRC+Jd/nKzyBKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85866204"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 17:20:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4r1B-000aCI-10;
	Sun, 27 Oct 2024 00:20:29 +0000
Date: Sun, 27 Oct 2024 08:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 7/8] ACPI: platform_profile: Add support for multiple
 handlers
Message-ID: <202410270821.oxnIPyOE-lkp@intel.com>
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
In-Reply-To: <20241025193055.2235-8-mario.limonciello@amd.com>
References: <20241025193055.2235-8-mario.limonciello@amd.com>
TO: Mario Limonciello <mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1349dd7dc21c63c9bad0e91fd1bf5f1ada34b0e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-platform-profile-Add-a-name-member-to-handlers/20241026-033443
base:   1349dd7dc21c63c9bad0e91fd1bf5f1ada34b0e2
patch link:    https://lore.kernel.org/r/20241025193055.2235-8-mario.limonciello%40amd.com
patch subject: [PATCH 7/8] ACPI: platform_profile: Add support for multiple handlers
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270821.oxnIPyOE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410270821.oxnIPyOE-lkp@intel.com/

smatch warnings:
drivers/acpi/platform_profile.c:123 platform_profile_store() error: uninitialized symbol 'err'.
drivers/acpi/platform_profile.c:125 platform_profile_store() error: uninitialized symbol 'profile'.
drivers/acpi/platform_profile.c:207 platform_profile_cycle() error: uninitialized symbol 'err'.
drivers/acpi/platform_profile.c:209 platform_profile_cycle() error: uninitialized symbol 'profile'.

vim +/err +123 drivers/acpi/platform_profile.c

a2ff95e018f1d2 Mark Pearson      2020-12-29   86  
a2ff95e018f1d2 Mark Pearson      2020-12-29   87  static ssize_t platform_profile_store(struct device *dev,
a2ff95e018f1d2 Mark Pearson      2020-12-29   88  			    struct device_attribute *attr,
a2ff95e018f1d2 Mark Pearson      2020-12-29   89  			    const char *buf, size_t count)
a2ff95e018f1d2 Mark Pearson      2020-12-29   90  {
77d5986ac45fab Mario Limonciello 2024-10-25   91  	struct platform_profile_handler *handler;
77d5986ac45fab Mario Limonciello 2024-10-25   92  	enum platform_profile_option profile;
a2ff95e018f1d2 Mark Pearson      2020-12-29   93  	int err, i;
a2ff95e018f1d2 Mark Pearson      2020-12-29   94  
a2ff95e018f1d2 Mark Pearson      2020-12-29   95  	/* Scan for a matching profile */
a2ff95e018f1d2 Mark Pearson      2020-12-29   96  	i = sysfs_match_string(profile_names, buf);
a2ff95e018f1d2 Mark Pearson      2020-12-29   97  	if (i < 0) {
a2ff95e018f1d2 Mark Pearson      2020-12-29   98  		return -EINVAL;
a2ff95e018f1d2 Mark Pearson      2020-12-29   99  	}
a2ff95e018f1d2 Mark Pearson      2020-12-29  100  
77d5986ac45fab Mario Limonciello 2024-10-25  101  	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
77d5986ac45fab Mario Limonciello 2024-10-25  102  		if (!platform_profile_is_registered())
77d5986ac45fab Mario Limonciello 2024-10-25  103  			return -ENODEV;
a2ff95e018f1d2 Mark Pearson      2020-12-29  104  
77d5986ac45fab Mario Limonciello 2024-10-25  105  		/* Check that all handlers support this profile choice */
77d5986ac45fab Mario Limonciello 2024-10-25  106  		list_for_each_entry(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25  107  			if (!test_bit(i, handler->choices))
77d5986ac45fab Mario Limonciello 2024-10-25  108  				return -EOPNOTSUPP;
b25d5a1cd19896 Hans de Goede     2021-08-16  109  
77d5986ac45fab Mario Limonciello 2024-10-25  110  			/* save the profile so that it can be reverted if necessary */
77d5986ac45fab Mario Limonciello 2024-10-25  111  			err = handler->profile_get(handler, &profile);
a2ff95e018f1d2 Mark Pearson      2020-12-29  112  			if (err)
a2ff95e018f1d2 Mark Pearson      2020-12-29  113  				return err;
77d5986ac45fab Mario Limonciello 2024-10-25  114  		}
77d5986ac45fab Mario Limonciello 2024-10-25  115  
77d5986ac45fab Mario Limonciello 2024-10-25  116  		list_for_each_entry(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25  117  			err = handler->profile_set(handler, i);
77d5986ac45fab Mario Limonciello 2024-10-25  118  			if (err) {
77d5986ac45fab Mario Limonciello 2024-10-25  119  				pr_err("Failed to set profile for handler %s\n", handler->name);
77d5986ac45fab Mario Limonciello 2024-10-25  120  				break;
77d5986ac45fab Mario Limonciello 2024-10-25  121  			}
77d5986ac45fab Mario Limonciello 2024-10-25  122  		}
77d5986ac45fab Mario Limonciello 2024-10-25 @123  		if (err) {
77d5986ac45fab Mario Limonciello 2024-10-25  124  			list_for_each_entry_continue_reverse(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25 @125  				if (handler->profile_set(handler, profile))
77d5986ac45fab Mario Limonciello 2024-10-25  126  					pr_err("Failed to revert profile for handler %s\n", handler->name);
77d5986ac45fab Mario Limonciello 2024-10-25  127  			}
77d5986ac45fab Mario Limonciello 2024-10-25  128  			return err;
77d5986ac45fab Mario Limonciello 2024-10-25  129  		}
77d5986ac45fab Mario Limonciello 2024-10-25  130  	}
77d5986ac45fab Mario Limonciello 2024-10-25  131  
77d5986ac45fab Mario Limonciello 2024-10-25  132  	sysfs_notify(acpi_kobj, NULL, "platform_profile");
a2ff95e018f1d2 Mark Pearson      2020-12-29  133  	return count;
a2ff95e018f1d2 Mark Pearson      2020-12-29  134  }
a2ff95e018f1d2 Mark Pearson      2020-12-29  135  
a2ff95e018f1d2 Mark Pearson      2020-12-29  136  static DEVICE_ATTR_RO(platform_profile_choices);
a2ff95e018f1d2 Mark Pearson      2020-12-29  137  static DEVICE_ATTR_RW(platform_profile);
a2ff95e018f1d2 Mark Pearson      2020-12-29  138  
a2ff95e018f1d2 Mark Pearson      2020-12-29  139  static struct attribute *platform_profile_attrs[] = {
a2ff95e018f1d2 Mark Pearson      2020-12-29  140  	&dev_attr_platform_profile_choices.attr,
a2ff95e018f1d2 Mark Pearson      2020-12-29  141  	&dev_attr_platform_profile.attr,
a2ff95e018f1d2 Mark Pearson      2020-12-29  142  	NULL
a2ff95e018f1d2 Mark Pearson      2020-12-29  143  };
a2ff95e018f1d2 Mark Pearson      2020-12-29  144  
a2ff95e018f1d2 Mark Pearson      2020-12-29  145  static const struct attribute_group platform_profile_group = {
a2ff95e018f1d2 Mark Pearson      2020-12-29  146  	.attrs = platform_profile_attrs
a2ff95e018f1d2 Mark Pearson      2020-12-29  147  };
a2ff95e018f1d2 Mark Pearson      2020-12-29  148  
a2ff95e018f1d2 Mark Pearson      2020-12-29  149  void platform_profile_notify(void)
a2ff95e018f1d2 Mark Pearson      2020-12-29  150  {
77d5986ac45fab Mario Limonciello 2024-10-25  151  	guard(mutex)(&profile_lock);
77d5986ac45fab Mario Limonciello 2024-10-25  152  	if (!platform_profile_is_registered())
a2ff95e018f1d2 Mark Pearson      2020-12-29  153  		return;
a2ff95e018f1d2 Mark Pearson      2020-12-29  154  	sysfs_notify(acpi_kobj, NULL, "platform_profile");
a2ff95e018f1d2 Mark Pearson      2020-12-29  155  }
a2ff95e018f1d2 Mark Pearson      2020-12-29  156  EXPORT_SYMBOL_GPL(platform_profile_notify);
a2ff95e018f1d2 Mark Pearson      2020-12-29  157  
ba95eb44676d68 Gergo Koteles     2024-04-08  158  int platform_profile_cycle(void)
ba95eb44676d68 Gergo Koteles     2024-04-08  159  {
77d5986ac45fab Mario Limonciello 2024-10-25  160  	struct platform_profile_handler *handler;
ba95eb44676d68 Gergo Koteles     2024-04-08  161  	enum platform_profile_option profile;
77d5986ac45fab Mario Limonciello 2024-10-25  162  	enum platform_profile_option next = PLATFORM_PROFILE_LAST;
77d5986ac45fab Mario Limonciello 2024-10-25  163  	enum platform_profile_option next2 = PLATFORM_PROFILE_LAST;
ba95eb44676d68 Gergo Koteles     2024-04-08  164  	int err;
ba95eb44676d68 Gergo Koteles     2024-04-08  165  
77d5986ac45fab Mario Limonciello 2024-10-25  166  	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
77d5986ac45fab Mario Limonciello 2024-10-25  167  		/* first pass, make sure all handlers agree on the definition of "next" profile */
77d5986ac45fab Mario Limonciello 2024-10-25  168  		list_for_each_entry(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25  169  
77d5986ac45fab Mario Limonciello 2024-10-25  170  			err = handler->profile_get(handler, &profile);
ba95eb44676d68 Gergo Koteles     2024-04-08  171  			if (err)
ba95eb44676d68 Gergo Koteles     2024-04-08  172  				return err;
ba95eb44676d68 Gergo Koteles     2024-04-08  173  
77d5986ac45fab Mario Limonciello 2024-10-25  174  			if (next == PLATFORM_PROFILE_LAST)
77d5986ac45fab Mario Limonciello 2024-10-25  175  				next = find_next_bit_wrap(handler->choices,
77d5986ac45fab Mario Limonciello 2024-10-25  176  							  PLATFORM_PROFILE_LAST,
77d5986ac45fab Mario Limonciello 2024-10-25  177  							  profile + 1);
77d5986ac45fab Mario Limonciello 2024-10-25  178  			else
77d5986ac45fab Mario Limonciello 2024-10-25  179  				next2 = find_next_bit_wrap(handler->choices,
77d5986ac45fab Mario Limonciello 2024-10-25  180  							   PLATFORM_PROFILE_LAST,
77d5986ac45fab Mario Limonciello 2024-10-25  181  							   profile + 1);
ba95eb44676d68 Gergo Koteles     2024-04-08  182  
77d5986ac45fab Mario Limonciello 2024-10-25  183  			if (WARN_ON(next == PLATFORM_PROFILE_LAST))
77d5986ac45fab Mario Limonciello 2024-10-25  184  				return -EINVAL;
ba95eb44676d68 Gergo Koteles     2024-04-08  185  
77d5986ac45fab Mario Limonciello 2024-10-25  186  			if (next2 == PLATFORM_PROFILE_LAST)
77d5986ac45fab Mario Limonciello 2024-10-25  187  				continue;
ba95eb44676d68 Gergo Koteles     2024-04-08  188  
77d5986ac45fab Mario Limonciello 2024-10-25  189  			if (next != next2) {
77d5986ac45fab Mario Limonciello 2024-10-25  190  				pr_warn("Next profile to cycle to is ambiguous between platform_profile handlers\n");
ba95eb44676d68 Gergo Koteles     2024-04-08  191  				return -EINVAL;
ba95eb44676d68 Gergo Koteles     2024-04-08  192  			}
77d5986ac45fab Mario Limonciello 2024-10-25  193  			next = next2;
77d5986ac45fab Mario Limonciello 2024-10-25  194  		}
ba95eb44676d68 Gergo Koteles     2024-04-08  195  
77d5986ac45fab Mario Limonciello 2024-10-25  196  		/*
77d5986ac45fab Mario Limonciello 2024-10-25  197  		 * Second pass: apply "next" to each handler
77d5986ac45fab Mario Limonciello 2024-10-25  198  		 * If any failures occur unwind and revert all back to the original profile
77d5986ac45fab Mario Limonciello 2024-10-25  199  		 */
77d5986ac45fab Mario Limonciello 2024-10-25  200  		list_for_each_entry(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25  201  			err = handler->profile_set(handler, next);
77d5986ac45fab Mario Limonciello 2024-10-25  202  			if (err) {
77d5986ac45fab Mario Limonciello 2024-10-25  203  				pr_err("Failed to set profile for handler %s\n", handler->name);
77d5986ac45fab Mario Limonciello 2024-10-25  204  				break;
77d5986ac45fab Mario Limonciello 2024-10-25  205  			}
77d5986ac45fab Mario Limonciello 2024-10-25  206  		}
77d5986ac45fab Mario Limonciello 2024-10-25 @207  		if (err) {
77d5986ac45fab Mario Limonciello 2024-10-25  208  			list_for_each_entry_continue_reverse(handler, &platform_profile_handler_list, list) {
77d5986ac45fab Mario Limonciello 2024-10-25 @209  				err = handler->profile_set(handler, profile);
77d5986ac45fab Mario Limonciello 2024-10-25  210  				if (err)
77d5986ac45fab Mario Limonciello 2024-10-25  211  					pr_err("Failed to revert profile for handler %s\n", handler->name);
77d5986ac45fab Mario Limonciello 2024-10-25  212  			}
77d5986ac45fab Mario Limonciello 2024-10-25  213  		}
77d5986ac45fab Mario Limonciello 2024-10-25  214  	}
ba95eb44676d68 Gergo Koteles     2024-04-08  215  
ba95eb44676d68 Gergo Koteles     2024-04-08  216  	sysfs_notify(acpi_kobj, NULL, "platform_profile");
ba95eb44676d68 Gergo Koteles     2024-04-08  217  
77d5986ac45fab Mario Limonciello 2024-10-25  218  	return 0;
ba95eb44676d68 Gergo Koteles     2024-04-08  219  }
ba95eb44676d68 Gergo Koteles     2024-04-08  220  EXPORT_SYMBOL_GPL(platform_profile_cycle);
ba95eb44676d68 Gergo Koteles     2024-04-08  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BFF38238C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639626; cv=none; b=GzStUPYUeXsPi5pd5AaBqztnYAAQm0K+Htd/vmABjNCBZO6SLKFHwp6rdrjJY97X/TFCTIIQKMlXOJtDQZY9h5OK0TveNrLXgw9BKR6vYrmakYAGm7N5t4MNhg7TLedPh+9spyykTRY+tJIf1bB+lBB/HeKaBwFIJRUv05hrnVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639626; c=relaxed/simple;
	bh=VNHNNpqzlWnNcd/b2rfEss5p/uK60VWCKsVnmqWRlUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UId7DUABSYe9k3/afHsAXd54LsCXhXrUyh90dGhldPZPZTA74vAdUi2smFWBM0g4HTwjbV+qEOyNmH8VMgOozFi+q0b5QkSrO5HSFNYJAuJV10/W4gda0j90SZBwf4q2gZjGyDQ2yrQVF0HSlE7W3iyw2OqLJ3zdosru5n1fnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBzZpdLJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBzZpdLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786639624; x=1818175624;
  h=date:from:to:cc:subject:message-id;
  bh=VNHNNpqzlWnNcd/b2rfEss5p/uK60VWCKsVnmqWRlUM=;
  b=hBzZpdLJDkbfF1R+eg472zo+XMn77NTMo7N386LATDGJtSZ9XS+rpmGs
   x5htEr3jNqq9cSSryLvIM8jXVdPxFWO5QQcRheBx8c7Ve5N679tPUsR0q
   fdIGvUnS6TZsM0i6ksfsBV9YPrfIcJos8wtf/BP5l9UTtzQ4LVnpKN5Zp
   8f3xUvjj+wn3Tjv2//nbSJxtpCbcihuqsw3KCd9HWghXYAavvuD1MK3HG
   c8JQsDP4c9fv8JtHEcCpbM/2+KV6g9mRYIHexP8xpeXhKhg9jaIgEdVHD
   HDm2dgJCk/mI1GwFVWbSfPwNSU60kHNK4RGuxt/1MFaQcOwsCHs67r3w5
   g==;
X-CSE-ConnectionGUID: 4fSfqwC/SmegodZYSQO7GQ==
X-CSE-MsgGUID: H6LK0GFYRTqYQhWf8m7IZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112764359"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="112764359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:47:03 -0700
X-CSE-ConnectionGUID: LMSSru/5SUyHzhdfcyOskA==
X-CSE-MsgGUID: BtlP17u3QBOxBchDcvLl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="262667084"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2026 09:47:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuYa4-00000000Vsg-1UZy;
	Thu, 13 Aug 2026 16:47:00 +0000
Date: Fri, 14 Aug 2026 00:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/vkms/vkms_formats.c:533: warning: Excess
 function parameter '__VA_ARGS__' description in 'READ_LINE_YUV_SEMIPLANAR'
Message-ID: <202608140027.8oBCYtDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Louis-Chauvet/drm-vkms-Create-helpers-macro-to-avoid-code-duplication-in-format-callbacks/20260813-163823, commit: 42090f8d9b7e32b8d5bea5a2ed24c16d728e564a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Louis Chauvet <louis.chauvet@bootlin.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Create-helpers-macro-to-avoid-code-duplication-in-format-callbacks/20260813-163823
head:   ab2b2459363297136691da9f09bbbb7713986659
commit: 42090f8d9b7e32b8d5bea5a2ed24c16d728e564a drm/vkms: Create helper macro for YUV formats
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140027.8oBCYtDW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140027.8oBCYtDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608140027.8oBCYtDW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_formats.c:345: warning: Excess function parameter '__VA_ARGS__' description in 'READ_LINE'
   drivers/gpu/drm/vkms/vkms_formats.c:356: warning: Function parameter or struct member 'a' not described in 'READ_LINE_ARGB8888'
   drivers/gpu/drm/vkms/vkms_formats.c:356: warning: Function parameter or struct member 'r' not described in 'READ_LINE_ARGB8888'
   drivers/gpu/drm/vkms/vkms_formats.c:356: warning: Function parameter or struct member 'g' not described in 'READ_LINE_ARGB8888'
   drivers/gpu/drm/vkms/vkms_formats.c:356: warning: Function parameter or struct member 'b' not described in 'READ_LINE_ARGB8888'
   drivers/gpu/drm/vkms/vkms_formats.c:366: warning: Function parameter or struct member 'a' not described in 'READ_LINE_le16161616'
   drivers/gpu/drm/vkms/vkms_formats.c:366: warning: Function parameter or struct member 'r' not described in 'READ_LINE_le16161616'
   drivers/gpu/drm/vkms/vkms_formats.c:366: warning: Function parameter or struct member 'g' not described in 'READ_LINE_le16161616'
   drivers/gpu/drm/vkms/vkms_formats.c:366: warning: Function parameter or struct member 'b' not described in 'READ_LINE_le16161616'
>> drivers/gpu/drm/vkms/vkms_formats.c:533: warning: Excess function parameter '__VA_ARGS__' description in 'READ_LINE_YUV_SEMIPLANAR'


vim +533 drivers/gpu/drm/vkms/vkms_formats.c

396369d6754993 Igor Torrente 2022-09-05  477  
fe22d21e934262 Arthur Grillo 2025-04-15  478  /*
fe22d21e934262 Arthur Grillo 2025-04-15  479   * This callback can be used for YUV formats where U and V values are
fe22d21e934262 Arthur Grillo 2025-04-15  480   * stored in the same plane (often called semi-planar formats). It will
fe22d21e934262 Arthur Grillo 2025-04-15  481   * correctly handle subsampling as described in the drm_format_info of the plane.
fe22d21e934262 Arthur Grillo 2025-04-15  482   *
fe22d21e934262 Arthur Grillo 2025-04-15  483   * The conversion matrix stored in the @plane is used to:
fe22d21e934262 Arthur Grillo 2025-04-15  484   * - Apply the correct color range and encoding
fe22d21e934262 Arthur Grillo 2025-04-15  485   * - Convert YUV and YVU with the same function (a column swap is needed when setting up
fe22d21e934262 Arthur Grillo 2025-04-15  486   * plane->conversion_matrix)
fe22d21e934262 Arthur Grillo 2025-04-15  487   */
fe22d21e934262 Arthur Grillo 2025-04-15  488  
42090f8d9b7e32 Louis Chauvet 2025-05-30  489  /**
42090f8d9b7e32 Louis Chauvet 2025-05-30  490   * READ_LINE_YUV_SEMIPLANAR() - Generic generator for a read_line function which can be used for yuv
42090f8d9b7e32 Louis Chauvet 2025-05-30  491   * formats with two planes and block_w == block_h == 1.
42090f8d9b7e32 Louis Chauvet 2025-05-30  492   *
42090f8d9b7e32 Louis Chauvet 2025-05-30  493   * @function_name: Function name to generate
42090f8d9b7e32 Louis Chauvet 2025-05-30  494   * @pixel_1_name: temporary pixel name for the first plane used in the @__VA_ARGS__ parameters
42090f8d9b7e32 Louis Chauvet 2025-05-30  495   * @pixel_2_name: temporary pixel name for the second plane used in the @__VA_ARGS__ parameters
42090f8d9b7e32 Louis Chauvet 2025-05-30  496   * @pixel_1_type: Used to specify the type you want to cast the pixel pointer on the plane 1
42090f8d9b7e32 Louis Chauvet 2025-05-30  497   * @pixel_2_type: Used to specify the type you want to cast the pixel pointer on the plane 2
42090f8d9b7e32 Louis Chauvet 2025-05-30  498   * @callback: Callback to call for each pixels. This function should take
42090f8d9b7e32 Louis Chauvet 2025-05-30  499   *            (struct conversion_matrix*, @__VA_ARGS__) as parameter and return a pixel_argb_u16
42090f8d9b7e32 Louis Chauvet 2025-05-30  500   * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_1_name and @pixel_2_name
42090f8d9b7e32 Louis Chauvet 2025-05-30  501   *               to access current pixel values
42090f8d9b7e32 Louis Chauvet 2025-05-30  502   */
42090f8d9b7e32 Louis Chauvet 2025-05-30  503  #define READ_LINE_YUV_SEMIPLANAR(function_name, pixel_1_name, pixel_2_name, pixel_1_type,	\
42090f8d9b7e32 Louis Chauvet 2025-05-30  504  				 pixel_2_type, callback, ...)					\
42090f8d9b7e32 Louis Chauvet 2025-05-30  505  static void function_name(const struct vkms_plane_state *plane, int x_start,			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  506  		 int y_start, enum pixel_read_direction direction, int count,			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  507  		 struct pixel_argb_u16 out_pixel[])						\
42090f8d9b7e32 Louis Chauvet 2025-05-30  508  {												\
42090f8d9b7e32 Louis Chauvet 2025-05-30  509  	u8 *plane_1;										\
42090f8d9b7e32 Louis Chauvet 2025-05-30  510  	u8 *plane_2;										\
42090f8d9b7e32 Louis Chauvet 2025-05-30  511  												\
42090f8d9b7e32 Louis Chauvet 2025-05-30  512  	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,				\
42090f8d9b7e32 Louis Chauvet 2025-05-30  513  			       &plane_1);							\
42090f8d9b7e32 Louis Chauvet 2025-05-30  514  	packed_pixels_addr_1x1(plane->frame_info,						\
42090f8d9b7e32 Louis Chauvet 2025-05-30  515  			       x_start / plane->frame_info->fb->format->hsub,			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  516  			       y_start / plane->frame_info->fb->format->vsub, 1,		\
42090f8d9b7e32 Louis Chauvet 2025-05-30  517  			       &plane_2);							\
42090f8d9b7e32 Louis Chauvet 2025-05-30  518  	int step_1 = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  519  	int step_2 = get_block_step_bytes(plane->frame_info->fb, direction, 1);			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  520  	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);		\
42090f8d9b7e32 Louis Chauvet 2025-05-30  521  	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);		\
42090f8d9b7e32 Louis Chauvet 2025-05-30  522  	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;		\
42090f8d9b7e32 Louis Chauvet 2025-05-30  523  												\
42090f8d9b7e32 Louis Chauvet 2025-05-30  524  	for (int i = 0; i < count; i++) {							\
42090f8d9b7e32 Louis Chauvet 2025-05-30  525  		pixel_1_type *(pixel_1_name) = (pixel_1_type *)plane_1;				\
42090f8d9b7e32 Louis Chauvet 2025-05-30  526  		pixel_2_type *(pixel_2_name) = (pixel_2_type *)plane_2;				\
42090f8d9b7e32 Louis Chauvet 2025-05-30  527  		*out_pixel = (callback)(conversion_matrix, __VA_ARGS__);			\
42090f8d9b7e32 Louis Chauvet 2025-05-30  528  		out_pixel += 1;									\
42090f8d9b7e32 Louis Chauvet 2025-05-30  529  		plane_1 += step_1;								\
42090f8d9b7e32 Louis Chauvet 2025-05-30  530  		if ((i + subsampling_offset + 1) % subsampling == 0)				\
42090f8d9b7e32 Louis Chauvet 2025-05-30  531  			plane_2 += step_2;							\
42090f8d9b7e32 Louis Chauvet 2025-05-30  532  	}											\
fe22d21e934262 Arthur Grillo 2025-04-15 @533  }
fe22d21e934262 Arthur Grillo 2025-04-15  534  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

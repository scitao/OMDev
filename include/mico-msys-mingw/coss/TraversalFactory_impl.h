// -*- c++ -*-
/*
 *  Relationship Service for MICO
 *  Copyright (C) 1998-99 Karel Gardas 
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *  Send comments and/or bug reports to:
 *                 mico@informatik.uni-frankfurt.de
 *  or to my private e-mail:
 *                 gardask@alpha.inf.upol.cz
 */


#ifndef __TraversalFactory_impl_h__
#define __TraversalFactory_impl_h__

#include "CosGraphs.h"


class TraversalFactory_impl : virtual public POA_CosGraphs::TraversalFactory
{
public:
  TraversalFactory_impl ();
  CosGraphs::Traversal_ptr create_traversal_on 
    (const CosGraphs::NodeHandle& root_node, 
     CosGraphs::TraversalCriteria_ptr the_criteria, CosGraphs::Mode how );
};


#endif

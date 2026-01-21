/**
 * Composable for fetching projects from Supabase
 */
export const useProjects = () => {
  const supabase = useSupabaseClient()

  /**
   * Get all active projects
   */
  const getAllProjects = async () => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('is_active', true)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching projects:', error)
      return []
    }
    return data || []
  }

  /**
   * Get a single project by slug
   */
  const getProjectBySlug = async (slug: string) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('slug', slug)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching project:', error)
      return null
    }
    return data
  }

  /**
   * Get a single project by ID
   */
  const getProjectById = async (id: string) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('id', id)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching project:', error)
      return null
    }
    return data
  }

  /**
   * Get projects by category
   */
  const getProjectsByCategory = async (category: string) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('category', category)
      .eq('is_active', true)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching projects by category:', error)
      return []
    }
    return data || []
  }

  /**
   * Get projects by badge (Popular, New, etc.)
   */
  const getProjectsByBadge = async (badge: string) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('badge', badge)
      .eq('is_active', true)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching projects by badge:', error)
      return []
    }
    return data || []
  }

  /**
   * Get featured projects for homepage carousel
   */
  const getFeaturedProjects = async (limit: number = 10) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('is_active', true)
      .order('created_at', { ascending: false })
      .limit(limit)

    if (error) {
      console.error('Error fetching featured projects:', error)
      return []
    }
    return data || []
  }

  /**
   * Get budget-friendly projects (price <= threshold)
   */
  const getBudgetProjects = async (maxPrice: number = 1800) => {
    const { data, error } = await supabase
      .from('projects')
      .select('*')
      .eq('is_active', true)
      .lte('price', maxPrice)
      .order('price', { ascending: true })

    if (error) {
      console.error('Error fetching budget projects:', error)
      return []
    }
    return data || []
  }

  return {
    getAllProjects,
    getProjectBySlug,
    getProjectById,
    getProjectsByCategory,
    getProjectsByBadge,
    getFeaturedProjects,
    getBudgetProjects,
  }
}
